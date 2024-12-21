import 'package:flutter/material.dart';

class Slide {
  final String title;
  final String text;
  final Image? picture;

  Slide(this.title, this.text, this.picture);
}

class SlideHolder {
  final List<Slide> slides;

  SlideHolder(this.slides);
}
