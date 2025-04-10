import 'package:flutter/material.dart';

MaterialColor createMaterialColor(String? condition) {
  final cond = condition?.toLowerCase();
  if (cond == null) {
    return Colors.blueGrey; // Default color if condition is null
  }

  if (cond.contains('clear') || cond.contains('sunny')) {
    return Colors.yellow;
  } else if (cond.contains('cloud')) {
    return Colors.grey;
  } else if (cond.contains('rain') ||
      cond.contains('drizzle') ||
      cond.contains('shower')) {
    return Colors.blue;
  } else if (cond.contains('snow') || cond.contains('blizzard')) {
    return Colors.lightBlue;
  } else if (cond.contains('thunder')) {
    return Colors.deepPurple;
  } else if (cond.contains('fog') || cond.contains('mist')) {
    return Colors.brown;
  } else if (cond.contains('freezing') ||
      cond.contains('ice') ||
      cond.contains('sleet')) {
    return Colors.cyan;
  } else {
    return Colors.blueGrey;
  }
}
