import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

@immutable
class History {
  const History({
    required this.id,
    required this.diceOne,
    required this.diceTwo,
    required this.timeStamp,
  });

  final String id;
  final int diceOne;
  final int diceTwo;
  final int timeStamp;

  @override
  String toString() {
    return 'History(diceOne: $diceOne, diceTwo: $diceTwo, timeStamp: $timeStamp)';
  }
}

/// An object that controls a list of [History].
class HistoryItems extends StateNotifier<List<History>> {
  HistoryItems([List<History>? initialHistories])
      : super(initialHistories ?? []);

  void add(int diceOne, diceTwo, timeStamp) {
    state = [
      ...state,
      History(
        id: _uuid.v4(),
        diceOne: diceOne,
        diceTwo: diceTwo,
        timeStamp: timeStamp,
      ),
    ];
  }

  void remove(History target) {
    //single remove
    // state = state.where((history) => history.id != target.id).toList();

    //all remove
    state = [];
  }
}
