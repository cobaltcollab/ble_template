import 'package:beamer/beamer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigation.dart';
import 'package:flutter_template/states/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeProvider = ref.watch(darkModeStateProvider);
    return MaterialApp.router(
      theme:
          FlexThemeData.light(scheme: FlexScheme.aquaBlue, useMaterial3: true),
      darkTheme:
          FlexThemeData.dark(scheme: FlexScheme.aquaBlue, useMaterial3: true),
      themeMode: darkModeProvider ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
