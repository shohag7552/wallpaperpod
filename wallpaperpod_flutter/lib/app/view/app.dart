import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/counter/counter.dart';
import 'package:wallpaperpod_flutter/deshboard/dashboard_screen.dart';
import 'package:wallpaperpod_flutter/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DashboardScreen(),
    );
  }
}
