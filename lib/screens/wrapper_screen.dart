// this screen should wrap all other screens.
// it containes the Scaffold, Appbar and the Bottombar

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
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

    final bleState = ref.read(bleStackStateProvider);
    final bleStateProvider = ref.read(bleStackStateProvider.notifier);
    final bleAppStateProvider = ref.read(bleAppProvider.notifier);
    // final bleAppState = ref.watch(bleAppProvider);
    return StreamBuilder(
        stream: FlutterBluePlus.instance.state,
        initialData: BluetoothState.unknown,
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          final data = snapshot.data;
          debugPrint("new state received, $data");
          switch (data) {
            case BluetoothState.off:
              bleStateProvider.set(BLEStackStates.off);
              bleAppStateProvider.set(BLEAppStates.bleUnavailable);

              break;
            case BluetoothState.on:
              bleStateProvider.set(BLEStackStates.on);
              bleAppStateProvider.set(BLEAppStates.readyToScan);

              break;
            case BluetoothState.unauthorized:
              bleStateProvider.set(BLEStackStates.unauthorized);
              bleAppStateProvider.set(BLEAppStates.bleUnavailable);

              break;

            default:
              bleStateProvider.set(BLEStackStates.unknown);
              bleAppStateProvider.set(BLEAppStates.bleUnavailable);

              break;
          }

          final bleStateIcon = getBLEStatusIcon(bleState);

          return Scaffold(
            appBar: AppBar(
              title: const Text('A Flutter Template App'),
              actions: [
                // bleStateIcon,
                IconButton(
                    onPressed: () {
                      darkModeProvider.toggle();
                    },
                    icon: Icon(
                        darkModeState ? Icons.light_mode : Icons.dark_mode))
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
        });
  }
}
