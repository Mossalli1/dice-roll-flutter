import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// A read-only description of a todo-item
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
  final int timeStamp ;

  @override
  String toString() {
    return 'History(diceOne: $diceOne, diceTwo: $diceTwo, timeStamp: $timeStamp)';
  }
}

/// An object that controls a list of [History].
class HistoryItems extends StateNotifier<List<History>> {
  HistoryItems([List<History>? initialHistories]) : super(initialHistories ?? []);

  void add(int diceOne, diceTwo, timeStamp) {
    state = [
      ...state,
      History(
        id: _uuid.v4(),
        // description: description,
        diceOne: diceOne,
        diceTwo: diceTwo,
        // timeStamp: DateTime.now().millisecondsSinceEpoch,
        timeStamp: timeStamp,
      ),
    ];
  }

  // void toggle(String id) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == id)
  //         Todo(
  //           id: todo.id,
  //           completed: !todo.completed,
  //           description: todo.description,
  //         )
  //       else
  //         todo,
  //   ];
  // }

  // void edit({required String id, required String description}) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == id)
  //         Todo(
  //           id: todo.id,
  //           completed: todo.completed,
  //           description: description,
  //         )
  //       else
  //         todo,
  //   ];
  // }

  void remove(History target) {
    //single remove
    // state = state.where((history) => history.id != target.id).toList();

    //all remove
    state=[];
  }
}