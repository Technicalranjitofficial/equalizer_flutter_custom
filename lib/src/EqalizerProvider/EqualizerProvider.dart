import 'package:equalizer_flutter/equalizer_flutter.dart';
import 'package:flutter/material.dart';

class EqualizerProvider extends ChangeNotifier {
  List<int> bandLevelRange = [];

  late double eqMinVal = -15;
  late double eqMaxVal = 15;
  bool custom = false;

  bool isEqEnabled = false;

  late double bassval = 500;

  var bands = <int>[0, 0, 0, 0, 0];

  bool EqInit = false;
  List<String> presets = [];
  String currentp = 'Normal';

  setBandRange(int id, int val) {
    bands[id] = val;
    if (id == 5) {
      notifyListeners();
    }
    // notifyListeners();
  }

  setBandRangeBTN(int id, int val) {
    bands[id] = val;
    notifyListeners();
    // notifyListeners();
  }

  Future<void> changeFreq(int bandid, int lowervalue) async {
    EqualizerFlutter.setBandLevel(bandid, lowervalue);
    setBandRangeBTN(bandid, lowervalue);
    custom = true;
    // setMinMaxEq();
    notifyListeners();
  }

  void setEqEnabled(bool cond) {
    isEqEnabled = cond;
    readyEqualiser(cond);
    notifyListeners();
  }

  void readyEqualiser(bool cond) {
    EqualizerFlutter.setEnabled(cond);
    // bassBoost.setEnabled(enabled: cond);
    notifyListeners();
  }

  initEqalizer(androidAudioSessionId) async {
    try {
      await EqualizerFlutter.init(androidAudioSessionId);
    } catch (e) {}
    print("base:$bassval");
    notifyListeners();
  }

  Future<List<String>> getPresest() async {
    presets = await EqualizerFlutter.getPresetNames();
    return presets;
  }

  setPresets(presetName) {
    EqualizerFlutter.setPreset(presetName);
    currentp = presetName;
    custom = false;
    notifyListeners();
  }

  setbassval(val) {
    bassval = val.toDouble();
    // bassBoost.setStrength(strength: bassval.toInt());
    print("base:$bassval");
    notifyListeners();
  }

  setMinMaxEq() {
    eqMinVal = bandLevelRange[0].toDouble();
    eqMaxVal = bandLevelRange[1].toDouble();
    notifyListeners();
  }
}
