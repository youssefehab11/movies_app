import 'package:flutter/material.dart';

class Onboard {
  final String? image;
  final String title;
  final String? description;
  final List<Color>? gradiantBg;

  const Onboard({
    required this.title,
    this.image,
    this.description,
    this.gradiantBg,
  });
}
