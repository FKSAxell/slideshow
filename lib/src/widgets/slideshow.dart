import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/slider_model.dart';
class SlideShow extends StatelessWidget {

  final List<Widget> slides;

  SlideShow({
    @required this.slides
  });



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new SliderModel(),
      child: Center(
        child: Column(
          children: [
            Expanded(child: _Slides( this.slides )), 
            _Dots(this.slides.length)
          ],
        )
      ),

      
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  _Dots( this.count );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 &&
                  pageViewIndex < index + 0.5) //OJO <=
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;
  _Slides( this.slides );

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('Página actual: ${pageViewController.page}');
      //Actualizar la instancia de la clase slidermodel
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svgs/1.svg'),
        //   _Slide('assets/svgs/2.svg'),
        //   _Slide('assets/svgs/3.svg'),
        // ],
        children: widget.slides.map(( slide ) => _Slide( slide )).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}
