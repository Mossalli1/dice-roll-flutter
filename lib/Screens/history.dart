import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';

import '../main.dart';

// class History extends StatefulWidget {
//   const History({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<History> createState() => _HistoryState();
// }

class History extends HookConsumerWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// This ensures that when we add/remove/edit todos, only what the
    /// impacted widgets rebuilds, instead of the entire list of items.
    final _currentHistory = Provider<History>((ref) => throw UnimplementedError());
    final histories = ref.watch(historyItemsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(historyItemsProvider.notifier).remove(histories[0]);
                },
                child: const Text('Clear history'),
              ),
              if(histories.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('No history'),
                  ),
                ),
              if (histories.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: histories.length,
                    itemBuilder: (context, index) {
                      final history = histories[index];
                      // final now = DateTime.now();
                      final DateTime date = DateTime.fromMicrosecondsSinceEpoch(history.timeStamp * 1000);
                      String dateString = Jiffy(date).yMMMMd;
                      String time = Jiffy(date).format('h:mm:ss a');
                      return ListTile(
                        title: Text('Dice-1 : ${history.diceOne} Dice-2 : ${history.diceTwo}'),
                        subtitle: Text(dateString),
                        trailing: Text(time),
                      );
                    },
                  ),
                ),
            ],
          )
        ));
  }
}
