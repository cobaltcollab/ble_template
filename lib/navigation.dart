import 'package:beamer/beamer.dart';
import 'package:flutter_template/screens/home.dart';
import 'package:flutter_template/screens/settings.dart';
import 'package:flutter_template/screens/wrapper_screen.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(routes: {
    // Return either Widgets or BeamPages if more customization is needed
    '/': (context, state, data) => const ParentScreen(child: ListViewer()),
    '/settings': (context, state, data) =>
        const ParentScreen(child: SettingsScreen()),
  }),
);
