import 'package:Material_Calculator/helper/helperfunctions.dart';
import 'package:Material_Calculator/views/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:Material_Calculator/views/calculator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loading(),
  ));
}