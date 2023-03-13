import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

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

  String _apiResult = '';
  String get apiResult => _apiResult;
  set apiResult(String _value) {
    _apiResult = _value;
  }

  String _apiResultStr = '';
  String get apiResultStr => _apiResultStr;
  set apiResultStr(String _value) {
    _apiResultStr = _value;
  }

  String _nullStr = '';
  String get nullStr => _nullStr;
  set nullStr(String _value) {
    _nullStr = _value;
  }

  String _testImg = '';
  String get testImg => _testImg;
  set testImg(String _value) {
    _testImg = _value;
  }

  dynamic _nullJson;
  dynamic get nullJson => _nullJson;
  set nullJson(dynamic _value) {
    _nullJson = _value;
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
