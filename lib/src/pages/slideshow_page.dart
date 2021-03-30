import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow/src/widgets/slideshow.dart';
class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideShow(
          // puntosArriba: true,
          // colorPrimario: Colors.red,
          // colorSecundario: Colors.purple,
          slides: [
            SvgPicture.asset('assets/svgs/1.svg'),
            SvgPicture.asset('assets/svgs/2.svg'),
            SvgPicture.asset('assets/svgs/3.svg'),
            SvgPicture.asset('assets/svgs/4.svg'),
            SvgPicture.asset('assets/svgs/5.svg'),
          ],
        )
      ),
    );
  }
}