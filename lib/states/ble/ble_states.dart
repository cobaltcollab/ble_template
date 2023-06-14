import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_template/states/core.dart';

final scannedDevicesProvider = getListStateNotifier<ScanResult>();

final connectedDeviceProvider = getGenericNotifier<BluetoothDevice?>(null);

final foundServicesProvider = getListStateNotifier<BluetoothService>();

final foundCharsProvider = getListStateNotifier<BluetoothCharacteristic>();

final isConnectedState = getBoolStateNotifier(initialValue: false);

// using records
final connectionDataProvider = getGenericNotifier<
    (
      BluetoothDevice?,
      BluetoothService?,
      BluetoothCharacteristic?
    )>((null, null, null));

enum BLEStackStates {
  unknown,
  unauthorized,
  on,
  off,
  error,
}

final bleStackStateProvider =
    getGenericNotifier<BLEStackStates>(BLEStackStates.unauthorized);

enum BLEAppStates {
  init,
  bleUnavailable, // either ble is off or unauthorized
  readyToScan, // ble is on and ready
  isScanning, // scan has been started
  readyToConnect, // a list of scanned devices is ready
  connecting, // app is connecting to a device
  isConnected, // app is connected to a device
  charNotified, // app is subscribed to a char
}

final bleAppProvider = getGenericNotifier<BLEAppStates>(BLEAppStates.init);
