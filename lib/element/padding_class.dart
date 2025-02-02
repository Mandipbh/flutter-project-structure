import 'package:flutter/material.dart';
import 'package:flutter_project_structure/element/responsive_size_value.dart';

///Padding Top
Widget paddingTop(double top) {
  return Padding(
    padding: EdgeInsets.only(top: setSp(top)),
  );
}

///Padding Left
Widget paddingLeft(double left) {
  return Padding(
    padding: EdgeInsets.only(left: setSp(left)),
  );
}

///Padding Right
Widget paddingRight(double right) {
  return Padding(
    padding: EdgeInsets.only(right: setSp(right)),
  );
}

///Padding Bottom
Widget paddingBottom(double bottom) {
  return Padding(
    padding: EdgeInsets.only(bottom: setSp(bottom)),
  );
}