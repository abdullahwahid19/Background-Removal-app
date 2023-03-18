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

  String _bgRemResult = '';
  String get bgRemResult => _bgRemResult;
  set bgRemResult(String _value) {
    _bgRemResult = _value;
  }

  String _logoAddResult = '';
  String get logoAddResult => _logoAddResult;
  set logoAddResult(String _value) {
    _logoAddResult = _value;
  }

  List<int> _logoImgPos = [];
  List<int> get logoImgPos => _logoImgPos;
  set logoImgPos(List<int> _value) {
    _logoImgPos = _value;
  }

  void addToLogoImgPos(int _value) {
    _logoImgPos.add(_value);
  }

  void removeFromLogoImgPos(int _value) {
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

  bool _imgLogo = false;
  bool get imgLogo => _imgLogo;
  set imgLogo(bool _value) {
    _imgLogo = _value;
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
