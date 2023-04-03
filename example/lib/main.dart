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
  late List<SongInfo> songs;

  late AudioPlayer audioPlayer;

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
                    Future.delayed(const Duration(milliseconds: 300))
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomEqualizer(
                              isEqEnabled: true,
                              playerSessionId:
                                  audioPlayer.androidAudioSessionId!,
                              bandTextColor: Colors.green,
                              sliderBoxHeight: 220,
                              sliderBoxPadding: 10,
                              appbarElevation: 0,
                              appBarShadowColor: Colors.grey,
                              titleTextStyle:
                                  const TextStyle(color: Colors.red),
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
