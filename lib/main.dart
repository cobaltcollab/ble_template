import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final permList = [
    Permission.location,
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothScan
  ];

  var permToAskList = <Permission>[];
  for (var perm in permList) {
    final status = await perm.status;
    debugPrint('${permList.indexOf(perm)},  ${status.name}');
    if (!(status.isGranted)) {
      permToAskList.add(perm);
    }
  }

  debugPrint(permToAskList.toString());
  if (permToAskList.isNotEmpty) {
    await permToAskList.request();
  }

  runApp(const ProviderScope(child: App()));
}
