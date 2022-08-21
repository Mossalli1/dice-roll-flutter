import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:dice_roll/Components/button.dart';
import 'package:dice_roll/Components/rollingDice.dart';
import 'package:dice_roll/main.dart';
import 'package:dice_roll/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      final diceOneUpdatedValue = ref.watch(firstDiceProvider);
      final diceTwoUpdatedValue = ref.watch(secondDiceOProvider);
      ref
          .read(historyItemsProvider.notifier)
          .add(diceOneUpdatedValue, diceTwoUpdatedValue, timeStamp);
    }

    void onGoHistory() async {
      context.router.push(History(title: 'History'));
    }

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
              children: [
                RollingDice(
                    color: Colors.black,
                    image: 'images/dice$diceOne.png',
                    valueKey: diceOne),
                const SizedBox(
                  width: 20,
                ),
                RollingDice(
                    color: Colors.red,
                    image: 'images/dice$diceTwo.png',
                    valueKey: diceTwo)
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: CustomButton(
                    buttonText: 'Roll Dice',
                    onPressed: () => onRollDice(),
                  ),
                ),
                Center(
                  child: CustomButton(
                    buttonText: 'Go to History',
                    onPressed: () => onGoHistory(),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
