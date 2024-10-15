import 'package:example/constants.dart';
import 'package:example/icons/icons.dart';
import 'package:example/header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:sdga_icons/sdga_icons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  SDGAIconsMapperBase _mapper = const SDGAIconsMapperBulk();
  SDGAIconStyle _style = SDGAIconStyle.bulk;

  void _updateMapper() {
    _mapper = switch (_style) {
      SDGAIconStyle.bulk => const SDGAIconsMapperBulk(),
      SDGAIconStyle.duotone => const SDGAIconsMapperDuotone(),
      SDGAIconStyle.solid => const SDGAIconsMapperSolid(),
      SDGAIconStyle.stroke => const SDGAIconsMapperStroke(),
      SDGAIconStyle.twotone => const SDGAIconsMapperTwotone(),
      SDGAIconStyle.sharpSolid => const SDGAIconsMapperSharpSolid(),
      SDGAIconStyle.sharpStroke => const SDGAIconsMapperSharpStroke(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("SDGA Icons (${_style.text})"),
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          actions: [
            PopupMenuButton<SDGAIconStyle>(
              initialValue: _style,
              icon: SDGAIcon(
                _mapper.moreVerticalCircle01,
              ),
              onSelected: (value) {
                setState(() {
                  _style = value;
                  _updateMapper();
                });
              },
              itemBuilder: (BuildContext context) => SDGAIconStyle.values
                  .map((style) => PopupMenuItem(
                        value: style,
                        child: Text(style.text),
                      ))
                  .toList(),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            for (final category in categories.keys) ...[
              SliverMainAxisGroup(
                slivers: [
                  _buildHeader(category),
                  SliverGrid.builder(
                    itemCount: categories[category]!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (MediaQuery.of(context).size.width / 128).round(),
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) =>
                        _buildIcon(categories[category]![index]),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String category) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HeaderDelegate(
        minHeight: 48,
        maxHeight: 48,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String name) {
    final icon = _mapper.getIcon(name);
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            SDGAIcon(
              icon,
              size: 48,
              color: const Color(0xFF1849A9),
            )
          else
            const SizedBox(
              width: 48,
              height: 48,
              child: Placeholder(),
            ),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
