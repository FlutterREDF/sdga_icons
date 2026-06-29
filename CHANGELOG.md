## 0.1.1
* **Fix**: Fixed an issue where tone icons were not rendering correctly.

## 0.1.0
* **Breaking Change**: Updated the minimum Dart SDK version requirement to `>=3.0.0`.
* **Breaking Change**: Refactored `SDGAIconData` to encapsulate Flutter's `IconData` rather than inheriting from it, preventing issues with Flutter's final `IconData` class and ensuring type safety.
* **Refactor**: Updated all generated icon classes (`SDGAIconsBulk`, etc.) to utilize the new `SDGAIconData` and `SDGAToneIconData` architecture.

## 0.0.2
* Updated readme.

## 0.0.1
* Initial release of the `sdga_icons` package.
