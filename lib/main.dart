import 'package:flutter/material.dart';
import 'package:movies_app/application.dart';
import 'package:movies_app/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MoviesApp());
}
