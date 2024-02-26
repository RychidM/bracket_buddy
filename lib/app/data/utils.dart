import 'package:flutter/material.dart';

class BuddyUtils {
  static  Color getAccentColor(int index) {
    int correctColorIndex = index % Colors.primaries.length;
    List<MaterialColor> shuffledColors = Colors.primaries.toList();
    shuffledColors.shuffle();
    return shuffledColors[correctColorIndex];
  }

  static List<Color> getAccentColors(int length) {
    List<MaterialColor> shuffledColors = Colors.primaries.toList();
    shuffledColors.shuffle();
    return shuffledColors.sublist(0, length);
  }
}