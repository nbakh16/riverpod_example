import 'package:couter_riverpod/counter_list_tile.dart';
import 'package:couter_riverpod/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void counterIncrement(int index, bool isIncrement) {
    ref.read(counterProvider.notifier).update((state) => [
      ...state.sublist(0, index),
          isIncrement ? state[index]+1 : state[index]-1,
          ...state.sublist(index+1, state.length),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    var counter = ref.watch(counterProvider);
    var countersList = ref.watch(counterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Total Counters: ${countersList.length}'),
      ),
      body: ListView.builder(
        itemCount: countersList.length,
        itemBuilder: (context, index) {
          return CounterListTile(
            title: counter[index].toString(),
            subTitle: 'Counter: ${index+1}',
            onTapAdd: ()=>counterIncrement(index, true),
            onTapRemove: ()=>counterIncrement(index, false),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterListProvider.notifier).update((state) => [
                ...state,
                const CounterListTile(title: 'title', subTitle: 'subTitle'),
              ]);

          ref.read(counterProvider.notifier).update((state) => [
            ...state, 0,
          ]);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
