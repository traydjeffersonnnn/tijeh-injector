import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inject_skin/hero_catalog.dart';
import 'package:inject_skin/main.dart';
import 'package:inject_skin/skin_script_urls.dart';

void main() {
  test('maps Yin Attack On Titan to the direct GitHub archive', () {
    final yin = heroCatalog.singleWhere((hero) => hero.name == 'Yin');

    expect(yin.role, MlbbRole.fighter);
    expect(yin.skinNames, contains('Attack On Titan'));
    expect(
      scriptUrlForSkin('Yin', 'Attack On Titan'),
      'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/YIN%20AOT.7z',
    );
  });

  testWidgets('shows the gold splash screen and iOS-style progress bar', (
    tester,
  ) async {
    await tester.pumpWidget(const TijehInjectorApp());

    expect(find.text('TIJEH INJECTOR'), findsOneWidget);
    expect(find.text('SKIN MLBB'), findsOneWidget);
    expect(find.text('MENYIAPKAN APLIKASI'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    expect(find.text('TIJEH INJECTOR'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('opens the assassin hero and skin catalog from the home screen', (
    tester,
  ) async {
    await tester.pumpWidget(const TijehInjectorApp());
    await tester.pump(const Duration(milliseconds: 2800));
    await tester.pumpAndSettle();

    expect(find.text('UNLOCK ALL SKIN'), findsOneWidget);
    await tester.tap(find.text('UNLOCK ALL SKIN'));
    await tester.pumpAndSettle();

    expect(find.text('Assassin'), findsOneWidget);
    await tester.tap(find.text('Assassin'));
    await tester.pumpAndSettle();

    expect(find.text('Aamon'), findsOneWidget);
    expect(find.text('Noble Crest'), findsOneWidget);

    await tester.tap(find.text('Noble Crest'));
    await tester.pumpAndSettle();
    expect(find.textContaining('URL script belum diatur'), findsOneWidget);
  });
}
