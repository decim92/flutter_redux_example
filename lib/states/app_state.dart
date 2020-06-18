import 'package:flutter/material.dart';

class AppState {
  final StyleState styleState;

  AppState({@required StyleState styleState}) : styleState = styleState;
}

class StyleState {
  double sliderFontSize;
  bool bold;
  bool italic;

  StyleState(
      {@required this.sliderFontSize, this.bold = false, this.italic = false});

  StyleState.fromStyleState(StyleState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  double get viewFontSize => sliderFontSize * 30;
}
