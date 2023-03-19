import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Uint8List _bgRemResult = Uint8List(0);
  Uint8List get bgRemResult => _bgRemResult;
  set bgRemResult(Uint8List _value) {
    _bgRemResult = _value;
  }

  Uint8List _logoAddResult = Uint8List(0);
  Uint8List get logoAddResult => _logoAddResult;
  set logoAddResult(Uint8List _value) {
    _logoAddResult = _value;
  }

  List<double> _logoImgPos = [];
  List<double> get logoImgPos => _logoImgPos;
  set logoImgPos(List<double> _value) {
    _logoImgPos = _value;
  }

  void addToLogoImgPos(double _value) {
    _logoImgPos.add(_value);
  }

  void removeFromLogoImgPos(double _value) {
    _logoImgPos.remove(_value);
  }

  void removeAtIndexFromLogoImgPos(int _index) {
    _logoImgPos.removeAt(_index);
  }

  bool _logoAdded = false;
  bool get logoAdded => _logoAdded;
  set logoAdded(bool _value) {
    _logoAdded = _value;
  }

  bool _imgLogo = true;
  bool get imgLogo => _imgLogo;
  set imgLogo(bool _value) {
    _imgLogo = _value;
  }

  Uint8List _imgLogoBytes = Uint8List(0);
  Uint8List get imgLogoBytes => _imgLogoBytes;
  set imgLogoBytes(Uint8List _value) {
    _imgLogoBytes = _value;
  }

  String _imgLogoBytesName = '';
  String get imgLogoBytesName => _imgLogoBytesName;
  set imgLogoBytesName(String _value) {
    _imgLogoBytesName = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
