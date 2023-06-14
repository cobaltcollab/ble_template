// this screen should wrap all other screens.
// it containes the Scaffold, Appbar and the Bottombar

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/states/ble/ble_states.dart';
import 'package:flutter_template/states/ble/ble_utils.dart';
import 'package:flutter_template/states/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ParentScreen extends HookConsumerWidget {
  const ParentScreen({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeProvider = ref.read(darkModeStateProvider.notifier);
    final darkModeState = ref.watch(darkModeStateProvider);

    final bottomIndex = useState<int>(0);

    final bleState = ref.watch(bleStackStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Flutter Template App'),
        actions: [
          getBLEStatusIcon(bleState),
          IconButton(
              onPressed: () {
                darkModeProvider.toggle();
              },
              icon: Icon(darkModeState ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: bottomIndex.value,
        elevation: 2,
        onTap: (index) {
          // switch (index) {
          //   case 0:
          //     context.beamToNamed("/");
          //     break;

          //   case 1:
          //     context.beamToNamed("/settings");
          //     break;
          // }
          bottomIndex.value = index;
        },
        iconSize: 24,
      ),
    );
  }
}
