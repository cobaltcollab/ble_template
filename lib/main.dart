import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  final permList = [
    Permission.location,
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothScan
  ];

  var permToAskList = <Permission>[];
  for (var perm in permList) {
    final status = await perm.status;
    if (!(status.isGranted)) {
      permToAskList.add(perm);
    }
  }

  await permToAskList.request();

  runApp(const ProviderScope(child: App()));
}
