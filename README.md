# TIL - Today I learned

[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

With TIL you will get an overview of what you learned in the past.
The app helps you understand, that you are indeed learning a lot, every day.

## Packages

- Freezed
- BLoC
- Dart Code Metrics
- Lint

## Requirements

- Overview Screen Past 7 Days

  - you learned 42 things in the past 7 days
  - last month you learned 9001 new knowledge

- I learned something right now
  - title
  - description

## Code Generation

This project uses build_runner to generate code. Run this command:
`flutter pub run build_runner build --delete-conflicting-outputs`

### Translations

`flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/src/core/translations -o locale_keys.dart`
