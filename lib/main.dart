import 'package:dice_roll/Controlers/historyControler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';


final historyItemsProvider = StateNotifierProvider<HistoryItems, List<History>>((ref) {
  return HistoryItems(const [
  ]);
});

// final diceOneProvider = StateProvider((ref) {
//   return 0;
// });
final firstDiceProvider = StateProvider((ref) => 1);
final secondDiceOProvider = StateProvider((ref) => 6);

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
