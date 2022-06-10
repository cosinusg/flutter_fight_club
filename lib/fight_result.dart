// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class FightResult {
  final String result;
  final Color color;

  const FightResult._(this.result, this.color);
  
  static const won = FightResult._("Won", Color.fromRGBO(3, 136, 0, 1));
  static const lost = FightResult._("Lost", Color.fromRGBO(234, 44, 44, 1));
  static const draw = FightResult._("Draw", Color.fromRGBO(28, 121, 206, 1));

  static const values = [won,lost,draw];

  static FightResult getByName(final String name) {
    return values.firstWhere((fightResult) => fightResult.result == name);
  }

  static FightResult? calculateResult (final int yourLives, final int enemysLives) {
    if (yourLives == 0 && enemysLives == 0) {
      return draw;      
    } else if (yourLives == 0) {
      return lost;
    } else if (enemysLives == 0) {
      return won;
    } else {
      return null;
    }
  }

  @override
  String toString() => 'FightResult(result: $result)';
}
