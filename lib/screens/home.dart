import 'package:flutter/material.dart';
import 'package:flutter_template/states/list_sample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewer extends HookConsumerWidget {
  const ListViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return SingleChildScrollView(
    //   controller: ScrollController(),
    //   child: Column(
    //     children: [
    //       if (bleAppState == BLEAppStates.readyToScan)
    //         ElevatedButton(onPressed: () {}, child: const Text('ready to scan'))
    //     ],
    //   ),
    // );

    // debugPrint("hello");
    // return Container();
    return Container();
    // return widget;
  }
}

addToList(WidgetRef ref) {
  var list = ref.read(sampleListStateProvider);
  ref.read(sampleListStateProvider.notifier).add('New Item #${list.length}');
}
