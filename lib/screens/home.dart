import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_template/states/ble/ble_states.dart';
import 'package:flutter_template/states/list_sample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewer extends HookConsumerWidget {
  const ListViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bleStateProvider = ref.read(bleStackStateProvider.notifier);
    final bleAppStateProvider = ref.read(bleAppProvider.notifier);
    final bleAppState = ref.watch(bleAppProvider);

    return StreamBuilder(
        stream: FlutterBluePlus.instance.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data) {
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
          }
          if (snapshot.hasError) {
            bleStateProvider.set(BLEStackStates.error);
          }

          return SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                if (bleAppState == BLEAppStates.readyToScan)
                  ElevatedButton(
                      onPressed: () {}, child: const Text('ready to scan'))
              ],
            ),
          );
        });
  }
}

addToList(WidgetRef ref) {
  var list = ref.read(sampleListStateProvider);
  ref.read(sampleListStateProvider.notifier).add('New Item #${list.length}');
}
