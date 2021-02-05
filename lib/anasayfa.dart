import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:fanela/acilirMenu.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffold.currentState.openDrawer();
          },
          tooltip: 'Menüyü Aç',
        ),
        title: Text(
          'FANELA',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),

        //centerTitle: true,

        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star,
            ),
            tooltip: 'puanla',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
            ),
            tooltip: 'paylaş',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showChooser,
        child: const Icon(Icons.wb_sunny_outlined),
      ),
      drawer: AcilirMenu(),
    );
  }

  void showChooser() {
    showDialog<void>(
        context: context,
        builder: (context) {
          return BrightnessSwitcherDialog(
            onSelectedTheme: (brightness) {
              DynamicTheme.of(context).setBrightness(brightness);
            },
          );
        });
  }
}
