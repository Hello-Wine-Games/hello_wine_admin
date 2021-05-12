import 'package:flutter/material.dart';
//import 'package:flutter_png/png.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';

class HWImages {
  static const wineGlass = 'assets/png/glass.png';
  static const barrel = 'assets/png/barrel.png';
  static const cork = 'assets/png/cork.png';
  static const food = 'assets/png/food.png';
  static const globe = 'assets/png/globe.png';
  static const grapes = 'assets/png/grapes.png';
  static const question = 'assets/png/question.png';
  static const state = 'assets/png/state.png';
  static const tower = 'assets/png/tower.png';

  static double menuHeight = 100;

  static Widget wineGlassIcon({Color color = HWTheme.burgundy}) => Image.asset(
        wineGlass,
        color: color,
        height: 120,
      );

  static Widget barrelIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(barrel, color: color, height: menuHeight);

  static Widget corkIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(cork, color: color, height: menuHeight);

  static Widget foodIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(food, color: color, height: menuHeight);

  static Widget globeIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(globe, color: color, height: menuHeight);

  static Widget grapesIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(grapes, color: color, height: menuHeight);

  static Widget questionIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(question, color: color, height: menuHeight);

  static Widget stateIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(state, color: color, height: menuHeight);

  static Widget towerIcon({Color color = HWTheme.burgundy}) =>
      Image.asset(tower, color: color, height: menuHeight);
}
