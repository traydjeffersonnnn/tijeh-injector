import 'package:flutter/cupertino.dart';

enum MlbbRole {
  assassin('Assassin', CupertinoIcons.bolt_fill),
  fighter('Fighter', CupertinoIcons.flame_fill),
  marksman('Marksman', CupertinoIcons.scope),
  tank('Tank', CupertinoIcons.shield_fill),
  mage('Mage', CupertinoIcons.sparkles),
  support('Support', CupertinoIcons.heart_fill);

  const MlbbRole(this.label, this.icon);

  final String label;
  final IconData icon;
}

class HeroProfile {
  const HeroProfile({
    required this.name,
    required this.role,
    required this.skinNames,
  });

  final String name;
  final MlbbRole role;
  final List<String> skinNames;
}

const _sampleSkinNames = ['Basic', 'Elite', 'Special'];

List<HeroProfile> _sampleHeroes(MlbbRole role, List<String> names) => names
    .map(
      (name) =>
          HeroProfile(name: name, role: role, skinNames: _sampleSkinNames),
    )
    .toList(growable: false);

final List<HeroProfile> heroCatalog = [
  const HeroProfile(
    name: 'Aamon',
    role: MlbbRole.assassin,
    skinNames: ['Noble Crest', 'Cyber Assassin', 'Soul Vessel'],
  ),
  const HeroProfile(
    name: 'Alucard',
    role: MlbbRole.assassin,
    skinNames: ['Lone Hero', 'Lightborn - Striker', 'Obsidian Blade'],
  ),
  const HeroProfile(
    name: 'Benedetta',
    role: MlbbRole.assassin,
    skinNames: ['Death Oath', 'Street Blow', 'Moonblade'],
  ),
  const HeroProfile(
    name: 'Fanny',
    role: MlbbRole.assassin,
    skinNames: ['Campus Youth', 'Lightborn - Ranger', 'Blade of Kibou'],
  ),
  const HeroProfile(
    name: 'Gusion',
    role: MlbbRole.assassin,
    skinNames: [
      'Hairstylist',
      'Venom - Emperor Scorpion',
      'Legend - Cosmic Gleam',
    ],
  ),
  const HeroProfile(
    name: 'Hanzo',
    role: MlbbRole.assassin,
    skinNames: ['Demon Thorn', 'Insidious Tutor', 'Soulfire Blade'],
  ),
  const HeroProfile(
    name: 'Hayabusa',
    role: MlbbRole.assassin,
    skinNames: ['Future Enforcer', 'Shura', 'Shadow of Obscurity'],
  ),
  const HeroProfile(
    name: 'Helcurt',
    role: MlbbRole.assassin,
    skinNames: ['Exoracial', 'Scorpio', 'Evolved Predator'],
  ),
  const HeroProfile(
    name: 'Joy',
    role: MlbbRole.assassin,
    skinNames: ['Royal Protector', 'Feline Wizard', 'Spirit of the Forest'],
  ),
  const HeroProfile(
    name: 'Karina',
    role: MlbbRole.assassin,
    skinNames: ['Black Pearl', 'Leona', 'Doom Duelist'],
  ),
  const HeroProfile(
    name: 'Lancelot',
    role: MlbbRole.assassin,
    skinNames: ['Royal Matador', 'Floral Knight', 'The Magnificent'],
  ),
  const HeroProfile(
    name: 'Ling',
    role: MlbbRole.assassin,
    skinNames: ['Night Shade', 'Collector - Serene Plume', 'Cosmo Guard'],
  ),
  const HeroProfile(
    name: 'Natalia',
    role: MlbbRole.assassin,
    skinNames: ['Phantom Dancer', 'Midnight Raven', 'Cyber Spectre'],
  ),
  const HeroProfile(
    name: 'Nolan',
    role: MlbbRole.assassin,
    skinNames: ['Astro Killer', 'The Navigator', 'Fashion Mogul'],
  ),
  const HeroProfile(
    name: 'Saber',
    role: MlbbRole.assassin,
    skinNames: ['Fullmetal Ronin', 'Onimaru', 'Codename - Storm'],
  ),
  const HeroProfile(
    name: 'Selena',
    role: MlbbRole.assassin,
    skinNames: ['Virus', 'Thunder Flash', 'Gemini - Shadow'],
  ),
  const HeroProfile(
    name: 'Suyou',
    role: MlbbRole.assassin,
    skinNames: ['Mask of the Immortal', 'Jadeblade Shadow', 'Peony Bloom'],
  ),
  const HeroProfile(
    name: 'Yi Sun-shin',
    role: MlbbRole.assassin,
    skinNames: ['Fleet Warden', 'Azure Sentry', 'Dreadnought'],
  ),
  ..._sampleHeroes(MlbbRole.fighter, [
    'Aulus',
    'Badang',
    'Dyrroth',
    'Guinevere',
    'Martis',
    'Ruby',
    'Yu Zhong',
  ]),
  const HeroProfile(
    name: 'Chou',
    role: MlbbRole.fighter,
    skinNames: [
      'Epic - Dragon Boy',
      'Special - Furious Tiger',
      'King of Muay Thai',
    ],
  ),
  const HeroProfile(
    name: 'Yin',
    role: MlbbRole.fighter,
    skinNames: ['Basic', 'Attack On Titan'],
  ),
  ..._sampleHeroes(MlbbRole.marksman, [
    'Beatrix',
    'Brody',
    'Bruno',
    'Claude',
    'Clint',
    'Granger',
    'Hanabi',
    'Layla',
    'Miya',
  ]),
  ..._sampleHeroes(MlbbRole.tank, [
    'Akai',
    'Atlas',
    'Belerick',
    'Franco',
    'Gatotkaca',
    'Hylos',
    'Tigreal',
  ]),
  ..._sampleHeroes(MlbbRole.mage, [
    'Alice',
    'Aurora',
    'Cecilion',
    'Eudora',
    'Kagura',
    'Lunox',
    'Nana',
    'Xavier',
  ]),
  ..._sampleHeroes(MlbbRole.support, [
    'Angela',
    'Diggie',
    'Estes',
    'Floryn',
    'Kaja',
    'Mathilda',
    'Rafaela',
  ]),
];
