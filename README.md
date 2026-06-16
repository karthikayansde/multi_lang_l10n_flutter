# multi_lang_l10n
- in yaml
  flutter_localizations:
    sdk: flutter
  intl:
- blow in flutter:
    generate: true
- create folder and files for l10n in lib
- create l10n.yaml file in root folder
- inside
  arb-dir: lib/l10n
  template-arb-file: app_en.arb
  output-localization-file: app_localizations.dart
  
- add imports
- run once to generate files
- implement in UI