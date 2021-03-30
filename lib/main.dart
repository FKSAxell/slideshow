import 'package:slideshow/src/pages/animaciones_page.dart';
import 'package:slideshow/src/labs/circular_progressbar_page.dart';
import 'package:slideshow/src/pages/graficas_circulares_page.dart';
import 'package:slideshow/src/pages/headers_page.dart';
import 'package:slideshow/src/labs/slideshow_page.dart';
import 'package:slideshow/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: SlideshowPage());
  }
}
