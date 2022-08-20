import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dice_roll/main.dart';
import 'package:dice_roll/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   // @override
//   // State<HomePage> createState() => _HomePageState();
// }

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diceOne = ref.watch(firstDiceProvider);
    final diceTwo = ref.watch(secondDiceOProvider);

    void onRollDice() async {
      final DateTime date = DateTime.now();
      final timeStamp = date.millisecondsSinceEpoch;
      ref.read(firstDiceProvider.state).state = Random().nextInt(6) + 1;
      ref.read(secondDiceOProvider.state).state = Random().nextInt(6) + 1;
      final diceOneUpdatedvalue = ref.watch(firstDiceProvider);
      final diceTwoUpdatedvalue = ref.watch(secondDiceOProvider);
      ref
          .read(historyItemsProvider.notifier)
          .add(diceOneUpdatedvalue, diceTwoUpdatedvalue, timeStamp);
    }

    void onGoHistory() async {
      context.router.push(History(title: 'History'));
    }

    // final String value = ref.watch(helloWorldProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // backgroundColor: Colors.blue,
              children: [
                Text('$diceOne'),
                SizedBox(
                  width: 120,
                ),
                Text('$diceTwo')
                


              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('Roll the dice'),
                    onPressed: () {
                      onRollDice();
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Go to history'),
                    onPressed: () {
                      onGoHistory();
                    },
                  ),
                ),
              ],
            )
            // Text(value)
          ],
        ));
  }
}
