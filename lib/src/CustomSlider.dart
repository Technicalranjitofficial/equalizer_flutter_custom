import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:equalizer_flutter/equalizer_flutter.dart';
import 'package:equalizer_flutter_custom/src/EqalizerProvider/EqualizerProvider.dart';
import 'package:equalizer_flutter_custom/src/Themes/GlobalThemes.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';

GlobalThemes globalThemes = GlobalThemes();

Widget CustomSlider(
  context,
  int bandId,
  int freq,
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
  double? sliderBoxPadding,
) {
  return Expanded(
    child: Padding(
      padding: sliderBoxPadding != null
          ? EdgeInsets.all(sliderBoxPadding)
          : const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: sliderBoxHeight ?? 220,
                decoration: BoxDecoration(
                    color: sliderBoxBackgroundColor ?? Colors.grey.shade800,
                    // boxShadow: const [
                    //   // BoxShadow(
                    //   //   offset: const Offset(-2, -2),
                    //   //   color: globalThemes.colors2['boxShadowWhite']!,
                    //   // ),
                    //   // BoxShadow(
                    //   //   offset: const Offset(2, 2),
                    //   //   color: globalThemes.colors2['boxShadowDark']!,
                    //   // ),
                    // ],
                    borderRadius:
                        sliderBoxBorderRadius ?? BorderRadius.circular(20)),
                child: FutureBuilder<int>(
                  future: EqualizerFlutter.getBandLevel(bandId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      context
                          .read<EqualizerProvider>()
                          .setBandRange(bandId, snapshot.data!);
                      // print("BandInfo:bandId-${bandId}: ${snapshot.data}");
                      return Consumer<EqualizerProvider>(
                        builder: (context, value, child) {
                          return FlutterSlider(
                            trackBar: FlutterSliderTrackBar(
                              inactiveTrackBar: BoxDecoration(
                                  color:
                                      inactiveTrackBar ?? Colors.grey.shade700),
                              centralWidget: Container(
                                color: midPointBgColor ?? Colors.grey.shade800,
                                child: Icon(
                                  midPointIcon ?? Icons.drag_handle,
                                  color: value.isEqEnabled
                                      ? midPointColorActive ??
                                          Colors.cyan.shade700
                                      : midPointColorInactive ??
                                          Colors.grey.shade600,
                                ),
                              ),
                              activeDisabledTrackBarColor:
                                  activeDisabledTrackBarColor ??
                                      globalThemes.colors2['bgColor']!,
                              inactiveDisabledTrackBarColor:
                                  inactiveDisabledTrackBarColor ??
                                      globalThemes.colors2['bgColor']!,
                              activeTrackBar: BoxDecoration(
                                  color: value.bands[bandId].toDouble() >
                                          max / 2 - 3
                                      ? activeTrackBarMaxColor ??
                                          Colors.pink.shade600
                                      : activeTrackBarMinColor ?? Colors.cyan),
                            ),
                            axis: Axis.vertical,
                            jump: true,
                            visibleTouchArea: true,
                            // lockHandlers: true,
                            disabled: !value.isEqEnabled,

                            handler: FlutterSliderHandler(
                                child: Stack(
                              children: [
                                Container(
                                  // color: Colors.cyan,

                                  decoration: BoxDecoration(
                                      color: value.isEqEnabled
                                          ? Colors.cyan
                                          : Colors.grey.shade700,
                                      shape: BoxShape.rectangle,
                                      gradient: value.isEqEnabled
                                          ? globalThemes.LinearGradient1
                                          : globalThemes.LinearGradient2),

                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(20))),
                                  // child: Icon(
                                  //   Icons.drag_indicator,
                                  //   color: value.isEqEnabled
                                  //       ? Colors.cyan
                                  //       : Colors.grey.shade600,
                                  // ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.black45,
                                  child: Icon(
                                    Icons.drag_indicator,
                                    size: 25,
                                    color: value.isEqEnabled
                                        ? dragIndicatorActiveColor ??
                                            Colors.cyan
                                        : dragIndicatorInactiveColor ??
                                            Colors.grey.shade600,
                                  ),
                                )
                              ],
                            )),
                            values: [value.bands[bandId].toDouble()],
                            rtl: true,
                            // visibleTouchArea: true,
                            max: max,
                            min: min,

                            // onDragging:
                            //     (handlerIndex, lowerValue, upperValue) async {

                            // },
                            onDragCompleted:
                                (handlerIndex, lowerValue, upperValue) {
                              value.changeFreq(bandId, lowerValue.toInt());
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "${(freq / 1000).toStringAsFixed(0)}HZ",
              style: TextStyle(
                  fontSize: bandTextFontSize ?? 12,
                  color: bandTextColor ?? globalThemes.colors2['textColor2']),
            ),
          )
        ],
      ),
    ),
  );
}
