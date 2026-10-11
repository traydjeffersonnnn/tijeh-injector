package com.tijeh.injector

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import rikka.shizuku.Shizuku
import java.io.BufferedReader
import java.io.File
import java.io.FileOutputStream
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.util.zip.ZipInputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.tijeh.injector/shizuku"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "injectFromGithub") {
                val urlString = call.argument<String>("url")
                val fileName = call.argument<String>("fileName")

                if (urlString == null || fileName == null) {
                    result.error("INVALID_ARGS", "URL atau Nama File kosong", null)
                    return@setMethodCallHandler
                }

                Thread {
                    try {
                        // Gunakan folder external files aplikasi sendiri: /sdcard/Android/data/com.tijeh.injector/files
                        // Folder ini aman dari ENOTCONN dan bisa dibaca oleh Shizuku
                        val workDir = context.getExternalFilesDir(null) ?: context.filesDir
                        val zipFile = File(workDir, fileName)
                        
                        // 1. Download file ZIP dari GitHub
                        val url = URL(urlString)
                        val connection = url.openConnection() as HttpURLConnection
                        connection.connect()

                        if (connection.responseCode != HttpURLConnection.HTTP_OK) {
                            runOnUiThread { Toast.makeText(applicationContext, "Gagal Download (HTTP ${connection.responseCode})", Toast.LENGTH_SHORT).show() }
                            result.success(false)
                            return@Thread
                        }

                        val inputStream = connection.inputStream
                        val outputStream = FileOutputStream(zipFile)
                        inputStream.copyTo(outputStream)
                        outputStream.close()
                        inputStream.close()

                        // 2. Ekstrak ZIP ke folder kerja sementara
                        val extractDir = File(workDir, "extracted_${System.currentTimeMillis()}")
                        extractDir.mkdirs()
                        unzip(zipFile, extractDir)

                        val subFiles = extractDir.listFiles()
                        var actualSourceDir = extractDir
                        if (subFiles != null && subFiles.size == 1 && subFiles[0].isDirectory) {
                            actualSourceDir = subFiles[0]
                        }

                        // 3. Target direktori Mobile Legends
                        val targetDirPath = "/sdcard/Android/data/com.mobile.legends/files/dragon2017/assets"

                        // 4. Jalankan perintah Shizuku untuk menyalin file dari folder kerja aplikasi ke game
                        val fullCmd = "mkdir -p '$targetDirPath' && cd '${actualSourceDir.absolutePath}' && cp -r . '$targetDirPath/'"
                        val process = executeShizukuCommand(arrayOf("sh", "-c", fullCmd))

                        if (process != null) {
                            val exitCode = process.waitFor()
                            val errorMsg = BufferedReader(InputStreamReader(process.errorStream)).readText()

                            // Bersihkan file zip dan folder ekstrak sementara
                            zipFile.delete()
                            extractDir.deleteRecursively()

                            if (exitCode == 0) {
                                runOnUiThread { Toast.makeText(applicationContext, "Injeksi Berhasil!", Toast.LENGTH_SHORT).show() }
                                result.success(true)
                            } else {
                                val displayErr = if (errorMsg.isNotBlank()) errorMsg.trim() else "Exit Code: $exitCode"
                                runOnUiThread { Toast.makeText(applicationContext, "Shizuku Error: $displayErr", Toast.LENGTH_LONG).show() }
                                result.success(false)
                            }
                        } else {
                            runOnUiThread { Toast.makeText(applicationContext, "Gagal menginisiasi Shizuku Process", Toast.LENGTH_LONG).show() }
                            result.success(false)
                        }

                    } catch (e: Exception) {
                        e.printStackTrace()
                        val errMsg = e.message ?: "Unknown error"
                        runOnUiThread { Toast.makeText(applicationContext, "Exception: $errMsg", Toast.LENGTH_LONG).show() }
                        result.error("EXCEPTION", errMsg, null)
                    }
                }.start()
            } else {
                result.notImplemented()
            }
        }
    }

    private fun executeShizukuCommand(cmd: Array<String>): Process? {
        return try {
            val method = Shizuku::class.java.getDeclaredMethod(
                "newProcess",
                Array<String>::class.java,
                Array<String>::class.java,
                String::class.java
            )
            method.isAccessible = true
            method.invoke(null, cmd, null, null) as? Process
        } catch (e: NoSuchMethodException) {
            try {
                val fallbackMethod = Shizuku::class.java.getDeclaredMethod(
                    "newProcess",
                    Array<String>::class.java,
                    Array<String>::class.java
                )
                fallbackMethod.isAccessible = true
                fallbackMethod.invoke(null, cmd, null) as? Process
            } catch (ex: Exception) {
                ex.printStackTrace()
                null
            }
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    private fun unzip(zipFile: File, targetDir: File) {
        ZipInputStream(zipFile.inputStream().buffered()).use { zis ->
            var zi = zis.nextEntry
            while (zi != null) {
                val file = File(targetDir, zi.name)
                if (zi.isDirectory) {
                    file.mkdirs()
                } else {
                    file.parentFile?.mkdirs()
                    FileOutputStream(file).use { out ->
                        zis.copyTo(out)
                    }
                }
                zis.closeEntry()
                zi = zis.nextEntry
            }
        }
    }
}