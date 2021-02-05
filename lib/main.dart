import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'FANELA Demo',
            theme: theme,
            home: AnaSayfa(title: 'FANELA Demo Home Page'),
          );
        });
  }
}
