import 'package:dice_roll/Toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';

import '../main.dart';

class History extends HookConsumerWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// impacted widgets rebuilds, instead of the entire list of items.
    // final _currentHistory =
    //     Provider<History>((ref) => throw UnimplementedError());

    final histories = ref.watch(historyItemsProvider);

    clearHistory() {
      histories.isNotEmpty
          ? ref.read(historyItemsProvider.notifier).remove(histories[0])
          : CustomToast.showToast('No history to clear');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
          child: Column(
        children: [
          if (histories.isEmpty)
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
                  final DateTime date = DateTime.fromMicrosecondsSinceEpoch(
                      history.timeStamp * 1000);
                  String dateString = Jiffy(date).yMMMMd;
                  String time = Jiffy(date).format('h:mm:ss a');
                  return ListTile(
                    title: Text(
                        'Dice one : ${history.diceOne}    Dice-two : ${history.diceTwo}'),
                    subtitle: Text(dateString),
                    trailing: Text(time),
                  );
                },
              ),
            ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => clearHistory(),
        tooltip: 'Clear history',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
