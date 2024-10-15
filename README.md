# sdga_icons

This repository provides a collection of +4000 icons used by the Saudi Digital Government Authority (SDGA), based on the [HugeIcons](https://hugeicons.com/) icon library. These icons are designed to maintain visual consistency and enhance the user experience.

Each icon in the collection has 7 variants:
* Bulk
* DuoTone
* TwoTone
* Solid
* Stroke
* Sharp Solid
* Sharp Stroke

[![GitHub stars](https://img.shields.io/github/stars/oghareeb/sdga_icons?style=flat-square&label=Star)](https://github.com/oghareeb/sdga_icons)
[![GitHub forks](https://img.shields.io/github/forks/oghareeb/sdga_icons?style=flat-square&label=Fork)](https://github.com/oghareeb/sdga_icons/fork)
[![GitHub watchers](https://img.shields.io/github/watchers/oghareeb/sdga_icons?style=flat-square&label=Watch)](https://github.com/oghareeb/sdga_icons)
[![Follow on GitHub](https://img.shields.io/github/followers/oghareeb?style=flat-square&label=Follow)](https://github.com/oghareeb)

## ScreenShots

![Screenshot Bulk](/screens/screenshot_bulk.png)
![Screenshot Duotone](/screens/screenshot_duotone.png)
![Screenshot Twotone](/screens/screenshot_twotone.png)
![Screenshot Solid](/screens/screenshot_solid.png)
![Screenshot Stroke](/screens/screenshot_stroke.png)
![Screenshot Sharp Solid](/screens/screenshot_sharp_solid.png)
![Screenshot Sharp Stroke](/screens/screenshot_sharp_stroke.png)

## Installation

In the dependencies: section of your `pubspec.yaml`, add the following line:

```yaml
sdga_icons: <latest_version>
```

## Usage

### `SDGAIcon` Widget
```dart
// import the package
import 'package:sdga_icons/sdga_icons.dart';

// Show the smile icon in it's bulk variant.
SDGAIcon(
  SDGAIconsBulk.smile,
  semanticLabel: 'Smile',
),
```
You could use any property of the [`Icon widget`](https://api.flutter.dev/flutter/widgets/Icon-class.html) to personalize the icon.

Choose the desired icon variant by using one of these classes:
* `SDGAIconsBulk`
* `SDGAIconsDuotone`
* `SDGAIconsSharpSolid`
* `SDGAIconsSharpStroke`
* `SDGAIconsSolid`
* `SDGAIconsStroke`
* `SDGAIconsTwotone`


### Flutter `Icon` Widget
You can also use the native flutter `Icon()` widget passing any `SDGAIcons` value

```dart
Icon(SDGAIconsSolid.smile), // Smile Icon
```

> NOTE: Due to some limitations with the flutter `Icon` widget when you pass any **`Bulk`**, **`Duotone`** or **`Twotone`**  icon it will only render part of the icon, because these variants are splitted into 2 icons, for this case prefer to use our custom `SDGAIcon` widget that works the same as `Icon` and support these variants


## Example App
You can see all the icons and variants within the example app.
Just clone the repository and run the example project within the repository
Or use the following commands:
```bash
cd sdga_icons/example
flutter pub get
flutter run
```
