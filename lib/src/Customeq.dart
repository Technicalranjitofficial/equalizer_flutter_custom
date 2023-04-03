import 'package:equalizer_flutter/equalizer_flutter.dart';
import 'package:equalizer_flutter_custom/src/CustomSlider.dart';
import 'package:flutter/material.dart';

Widget Customeq(
    min,
    max,
    double? sliderBoxHeight,
    Color? sliderBoxBackgroundColor,
    BorderRadiusGeometry? sliderBoxBorderRadius,
    Color? inactiveTrackBar,
    Color? midPointBgColor,
    Color? midPointColorActive,
    Color? midPointColorInactive,
    IconData? midPointIcon,
    Color? activeDisabledTrackBarColor,
    Color? inactiveDisabledTrackBarColor,
    Color? activeTrackBarMaxColor,
    Color? activeTrackBarMinColor,
    Color? dragIndicatorActiveColor,
    Color? dragIndicatorInactiveColor,
    Color? bandTextColor,
    double? bandTextFontSize,
    double? sliderBoxPadding) {
  int bandId = 0;
  return FutureBuilder<List<int>>(
    future: EqualizerFlutter.getCenterBandFreqs(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: snapshot.data!
                    .map((freq) => CustomSlider(
                          context,
                          bandId++,
                          freq,
                          min,
                          max,
                          sliderBoxHeight,
                          sliderBoxBackgroundColor,
                          sliderBoxBorderRadius,
                          inactiveTrackBar,
                          midPointBgColor,
                          midPointColorActive,
                          midPointColorInactive,
                          midPointIcon,
                          activeDisabledTrackBarColor,
                          inactiveDisabledTrackBarColor,
                          activeTrackBarMaxColor,
                          activeTrackBarMinColor,
                          dragIndicatorActiveColor,
                          dragIndicatorInactiveColor,
                          bandTextColor,
                          bandTextFontSize,
                          sliderBoxPadding,
                        ))
                    // .map((freq) => Container())
                    .toList(),
              )
            ],
          );
        } else {
          return const Text("Audio SessionId empty");
        }
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}
