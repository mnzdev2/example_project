import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:example_project/config/themes/app_themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    dropdownValue = DynamicTheme.of(context)!.themeId;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Text('Select your theme here:'),
          ),
          DropdownButton(
              icon: const Icon(Icons.arrow_downward),
              value: dropdownValue,
              items: [
                DropdownMenuItem(
                  value: AppThemes.lightBlue,
                  child: Text(AppThemes.toStr(AppThemes.lightBlue)),
                ),
                DropdownMenuItem(
                  value: AppThemes.lightRed,
                  child: Text(AppThemes.toStr(AppThemes.lightRed)),
                ),
                DropdownMenuItem(
                  value: AppThemes.darkBlue,
                  child: Text(AppThemes.toStr(AppThemes.darkBlue)),
                ),
                DropdownMenuItem(
                  value: AppThemes.darkRed,
                  child: Text(AppThemes.toStr(AppThemes.darkRed)),
                )
              ],
              onChanged: (dynamic themeId) async {
                await DynamicTheme.of(context)!.setTheme(themeId);
                setState(() {
                  dropdownValue = themeId;
                });
              }),
          Container(
              margin: const EdgeInsets.all(20),
              width: 100,
              height: 100,
              color: theme.primaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Container in primary color and primary text theme',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodyText2),
                ),
              )),
          Container(
            margin: const EdgeInsets.all(20),
            width: 100,
            height: 100,
            color: theme.colorScheme.secondary,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('Container in accent color and with accent text theme',
                      textAlign: TextAlign.center,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).accentTextTheme.bodyText2),
            )),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
