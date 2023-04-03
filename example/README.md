
# Music Player Equalizer

Flutter_Equalizer_Custom is a flutter package which allow you to make your custom music player Equalizer.You can use this package to create a beautiful Equalizer without writing a bunch of code.






![App Screenshot](https://user-images.githubusercontent.com/112815459/229370288-02281b68-8570-406f-8cc0-7619116298ec.jpg)


## Documentation

[Documentation](https://github.com/Technicalranjitofficial/equalizer_flutter_custom)


## Installation

##### Add to pubspeck.yaml
    dependencies:
       equalizer_flutter_custom: ^0.0.1

    or

    flutter pub add equalizer_flutter_custom
 
## Quick synopsis 

```dart

CustomEqualizer(
     isEqEnabled: true, //Enable Equalizer
     playerSessionId:androidAudioSessionId!,//IMPORTANT AudioSessionId ),

```

#### Setup: Edit AndroidManifest.xml

      <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.example">

      <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
      <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
      <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />

      </manifest>


#### Add This Dependency to pubspec.yml
    dependencies:
      provider: any



##### Wrap Your MaterialApp with ChangeNotifierProvider

```dart


@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EqualizerProvider(),// Import this from Current Package
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }

```


### Example with Complete Code

```dart

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'package:equalizer_flutter_custom/src/CustomEqualizer.dart';
import 'package:provider/provider.dart';
import 'package:equalizer_flutter_custom/src/EqalizerProvider/EqualizerProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EqualizerProvider(),
      child: MaterialApp(
        title: 'Demo Equalizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<SongInfo> songs; //flutter_audio_query 

  late AudioPlayer audioPlayer; // using just_audio package. You can use your own.

  bool isLoading = true;
  getSOngs() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    List<SongInfo> songsd = await audioQuery.getSongs();
    setState(() {
      songs = songsd;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    audioPlayer = AudioPlayer();
    getSOngs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Equalizer"),
      ),
      // body:
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    audioPlayer.setUrl(songs[index].filePath);
                    audioPlayer.play();
                    Future.delayed(const Duration(milliseconds: 300)) // Make Sure Your Audio must be playing before accessing the equalizer for the first time. You can handle your own function.
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  

                            //Equalizer_flutter_custom

                            CustomEqualizer( 
                              isEqEnabled: true, //Enable Equalizer
                              playerSessionId:
                                  audioPlayer.androidAudioSessionId!,// Most Important AudioSessionId NOT NULL
                              bandTextColor: Colors.green,
                              sliderBoxHeight: 220,
                              sliderBoxPadding: 10,
                              sliderBoxBorderRadius: BorderRadius.circular(20),
                            ),
                          ));
                    });
                  },
                  child: ListTile(
                    title: Text(songs[index].displayName),
                  ),
                );
              },
            ),
    );
  }
}

```


     

## Features

  - double? sliderBoxHeight; // Set the slider Box Height
  - Color? sliderBoxBackgroundColor; // Set SliderBox Bg Color
  - BorderRadius? sliderBoxBorderRadius; // Give borderRadius to Sliderbox
  - Color? inactiveTrackBar; // Change Slider inactiveTrackBar Color
  - Color? midPointBgColor;  // Change mid item Color
  - Color? midPointColorActive; // Mid item active color
  - Color? midPointColorInactive; // Mid item inActive color
  - IconData? midPointIcon; // set Custom Mid item Icons
  - Color? activeDisabledTrackBarColor; // set activeDisabledTrackBarColor 
  - Color? inactiveDisabledTrackBarColor; // set inactiveDisabledTrackBarColor color
  - Color? activeTrackBarMaxColor; // display custom color for high band
  - Color? activeTrackBarMinColor; // set active trackbarMinColor
  - Color? dragIndicatorActiveColor; // set drag handle active color
  - Color? dragIndicatorInactiveColor; //set drag handle inactive color
  - Color? bandTextColor; // custom text color for band
  - double? bandTextFontSize; // set custom text font for band text
  - TextStyle? presetsStyle; // band presets style
  - BoxDecoration? presetsBoxDecoration; // band box BoxDecoration
  - Color? baseTextColor; // bass text color
  - Widget? customSwitch; // Implement custom Switch instead of Default
  - bool isEqEnabled; // onn/off Equalizer
  - Color? appBarShadowColor; //appBarBgColor
  - String? appBarTitle; //appBarTitle custom
  - IconThemeData? actionsIconTheme;
  - bool? automaticallyImplyLeading;
  - Color? appBarBgColor;
  - double? appbarElevation;
  - Widget? appBarLeading;
  - TextStyle? titleTextStyle;
  - Color? inActiveSwitchTrackColor;
  - Color? activeSwitchTrackColor;
  - Color? activeSwitchColor;
  - Color? bgColor;- double? sliderBoxPadding;
## Color Reference

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Example Color | ![#0a192f](https://via.placeholder.com/10/0a192f?text=+) #0a192f |
| Example Color | ![#f8f8f8](https://via.placeholder.com/10/f8f8f8?text=+) #f8f8f8 |
| Example Color | ![#00b48a](https://via.placeholder.com/10/00b48a?text=+) #00b48a |
| Example Color | ![#00d1a0](https://via.placeholder.com/10/00b48a?text=+) #00d1a0 |


## License

MIT License

Copyright (c) 2023 Technicalranjit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

