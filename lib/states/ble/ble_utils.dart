import 'package:flutter/material.dart';
import 'package:flutter_template/states/ble/ble_states.dart';

Widget getBLEStatusIcon(BLEStackStates state, {double size = 24}) {
  switch (state) {
    case BLEStackStates.off:
      return Icon(Icons.bluetooth_disabled,
          color: Colors.redAccent, size: size);
    case BLEStackStates.on:
      return Icon(Icons.bluetooth_rounded,
          color: Colors.greenAccent, size: size);
    case BLEStackStates.unauthorized:
      return Icon(Icons.key_off, color: Colors.red, size: size);
    case BLEStackStates.unknown:
      return Icon(Icons.device_unknown, color: Colors.red, size: size);
    case BLEStackStates.error:
      return Icon(Icons.error, color: Colors.red, size: size);
  }
}
