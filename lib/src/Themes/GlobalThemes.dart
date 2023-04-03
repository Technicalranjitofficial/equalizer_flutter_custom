import 'package:flutter/material.dart';

class GlobalThemes {
  var colors = {
    "BgCOlorDark": const Color.fromARGB(255, 49, 48, 48),
    "BgCOlorWhite": const Color.fromARGB(255, 7, 7, 7),
    "SeekBarColor": const Color.fromARGB(255, 7, 7, 7),
    "SeekBarBaseColor": const Color.fromARGB(255, 7, 7, 7),
    "SeekBarHandler": const Color.fromARGB(255, 252, 252, 252),
    "BtnPlay": const Color.fromARGB(255, 48, 49, 48),
    "BtnPlayIcon": const Color.fromARGB(255, 113, 114, 113),
    "IconBtn": Colors.grey.shade700,
    "btnColor": const Color.fromARGB(255, 7, 7, 7),
    "boxShadowWhite": const Color.fromARGB(255, 141, 135, 135),
    "boxShadowDark": const Color.fromARGB(255, 21, 20, 20),
    "textColor1": Colors.grey.shade600,
    "textColor2": Colors.grey.shade700,
    "playerThemesColor": Colors.grey.shade900,
  };

  var colors2 = {
    "bgColor": const Color.fromARGB(255, 49, 48, 48),
    "SeekBarColor": Colors.grey.shade800,
    "SeekBarBaseColor": const Color.fromARGB(255, 49, 48, 48),
    "SeekBarHandler": const Color.fromARGB(255, 172, 170, 170),
    "SeekBarHandlerCircular": const Color.fromARGB(255, 101, 98, 98),
    "BtnPlay": Colors.cyan.shade900,
    "IconBtn": Colors.grey.shade600,
    "btnColor": const Color.fromARGB(255, 49, 48, 48),
    "BtnPlayIcon": const Color.fromARGB(255, 113, 114, 113),
    "boxShadowWhite": const Color.fromARGB(255, 88, 87, 87),
    "boxShadowDark": const Color.fromARGB(255, 20, 19, 19),
    "textColor2": Colors.grey.shade500,
    "textColor3": Colors.grey.shade600,
    "textColor1": Colors.cyan.shade700,
    "headColor": Colors.cyan.shade700,
    "subTitles": Colors.cyan.shade700,
    "divider": Colors.grey.shade800,
    "label": Colors.grey.shade400,
    "playerThemesColor": Colors.grey.shade900,
    "playerThemesColor2": Colors.grey.shade500,
  };

  var colors3 = {
    "bgColor": const Color.fromARGB(255, 9, 89, 90),
    "SeekBarColor": Colors.grey.shade800,
    "SeekBarBaseColor": const Color.fromARGB(255, 49, 48, 48),
    "SeekBarHandler": const Color.fromARGB(255, 172, 170, 170),
    "SeekBarHandlerCircular": const Color.fromARGB(255, 101, 98, 98),
    "BtnPlay": Colors.cyan.shade900,
    "IconBtn": const Color.fromARGB(255, 172, 169, 169),
    "btnColor": const Color.fromARGB(255, 49, 48, 48),
    "BtnPlayIcon": const Color.fromARGB(255, 172, 169, 169),
    "boxShadowWhite": const Color.fromARGB(255, 200, 195, 195),
    "boxShadowDark": const Color.fromARGB(255, 60, 57, 57),
    "textColor2": Colors.grey.shade500,
    "textColor1": Colors.grey.shade400,
    "headColor": Colors.cyan.shade700,
    "subTitles": Colors.cyan.shade700,
    "divider": Colors.grey.shade800,
    "label": Colors.grey.shade400,
    "playerThemesColor": Colors.grey.shade900,
    "playerThemesColor2": Colors.grey.shade500,
  };

  var PlayerTheme = BlendMode.color;
  var PlayerTheme2 = BlendMode.multiply;
  var LinearGradient1 = LinearGradient(
      colors: [
        Colors.cyan.shade700,
        Colors.teal.shade800,
        Colors.pink.shade500,
      ],
      tileMode: TileMode.decal,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  var LinearGradient2 = const LinearGradient(
      colors: [
        Color.fromARGB(255, 57, 57, 57),
        Color.fromARGB(255, 20, 20, 20),
      ],
      tileMode: TileMode.decal,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  var btnGradient1 = LinearGradient(
      colors: [
        Colors.cyan.shade700,
        Colors.pink.shade900,
        Colors.teal.shade800,
      ],
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      tileMode: TileMode.clamp);
}




//  "BgCOlorDark": Color.fromARGB(255, 49, 48, 48),
//     "BgCOlorWhite": Color.fromARGB(255, 252, 252, 252),
//     "SeekBarColor": Colors.cyan,
//     "SeekBarBaseColor": Color.fromARGB(255, 49, 48, 48),
//     "SeekBarHandler": Color.fromARGB(255, 49, 48, 48),
//     "BtnPlay": Colors.cyan.shade600,
//     "IconBtn": Colors.grey.shade500,
//     "btnColor": Color.fromARGB(255, 49, 48, 48),
//     "boxShadowWhite": Color.fromARGB(255, 88, 87, 87),
//     "boxShadowDark": Color.fromARGB(255, 20, 19, 19),
//     "textColor1": Colors.white60,
//     "textColor2": Colors.cyan,