import 'package:flutter/material.dart';
import 'package:flutter_template/states/list_sample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewer extends HookConsumerWidget {
  const ListViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleListState = ref.watch(sampleListStateProvider);

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              addToList(ref);
            },
            child: const Text("Add to List"),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  width: MediaQuery.of(context).size.width / 2,
                  // child: ListView(
                  //     children: sampleListState.map((e) => Text(e)).toList())
                  child: ListView.builder(
                    itemCount: sampleListState.length,
                    itemBuilder: (context, index) =>
                        Text(sampleListState[index]),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

addToList(WidgetRef ref) {
  var list = ref.read(sampleListStateProvider);
  ref.read(sampleListStateProvider.notifier).add('New Item #${list.length}');
}
