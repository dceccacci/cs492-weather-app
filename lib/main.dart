import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/widgets/forecast/forecast_tab_widget.dart';
import 'package:weatherapp/widgets/location/location_tab_widget.dart';
import 'package:weatherapp/providers/location_provider.dart';
import 'package:weatherapp/providers/forecast_provider.dart';

import 'utils/theme_mode.dart' as themeMode;

// TODOS: The TODOs are located in Assignment8-1 in canvas assignments
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ForecastProvider()),
    ChangeNotifierProvider(create: (context) => LocationProvider(Provider.of<ForecastProvider>(context, listen: false))),
    ChangeNotifierProvider(create: (context) => themeMode.ThemeNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'CS492 Weather App';

  @override
  Widget build(BuildContext context) {
    return Consumer<themeMode.ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: title,
          theme: themeMode.lightTheme,
          darkTheme: themeMode.darkTheme,
          themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: MyHomePage(title: title),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.sunny_snowing)),
              Tab(icon: Icon(Icons.edit_location_alt)),
              Consumer<themeMode.ThemeNotifier>(
                builder: (context, themeNotifier, child) {
                  return Switch(
                      value: themeNotifier.isDarkMode,
                      onChanged: (value) {
                        themeNotifier.toggleTheme();
                      },
                    );
                },
               ),
            ])),
        body: TabBarView(children: [ForecastTabWidget(), LocationTabWidget()]),
      ),
    );
  }
}
