import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studio/utils/FCIStyle.dart';

class ImagesCarousel extends StatefulWidget {
  List<String> networkImages;
  ImagesCarousel({required this.networkImages});
  @override
  State<StatefulWidget> createState() {
    return _ImagesCarouselState();
  }
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  List<Widget> imageSliders = [];
  int active = 0;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    imageSliders = widget.networkImages
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: Text(
                              'خصومات الصيف\n\n 50%',
                              style: FCITextStyle.bold(18,
                                  color: FCIColors.whiteColor()),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              // enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 2.0,
              initialPage: active,
              reverse: true,
              onPageChanged: (index, reason) {
                setState(() {
                  active = index;
                });
              },
              height: ScreenUtil().setHeight(150)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...Iterable<int>.generate(widget.networkImages.length).map(
              (int pageIndex) => indicators(pageIndex),
            ),
          ],
        )
      ]);
  Widget indicators(currentIndex) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 25,
      height: 2.5,
      decoration: BoxDecoration(
          color: active == currentIndex ? Colors.black : Colors.black26,
          shape: BoxShape.rectangle),
    );
  }
}

class ImagesCarousel2 extends StatefulWidget {
  List<String> networkImages;
  ImagesCarousel2({required this.networkImages});
  @override
  State<StatefulWidget> createState() {
    return _ImagesCarouselState2();
  }
}

class _ImagesCarouselState2 extends State<ImagesCarousel2> {
  List<Widget> imageSliders = [];
  int active = 0;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    imageSliders = widget.networkImages
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                        // Positioned(
                        //   top: 0.0,
                        //   left: 0.0,
                        //   right: 0.0,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //         colors: [
                        //           Color.fromARGB(200, 0, 0, 0),
                        //           Color.fromARGB(0, 0, 0, 0)
                        //         ],
                        //         end: Alignment.bottomCenter,
                        //         begin: Alignment.topCenter,
                        //       ),
                        //     ),
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 20.0, horizontal: 20.0),
                        //     child: Text(
                        //       'خصومات الصيف\n\n 50%',
                        //       style: FCITextStyle.bold(18,
                        //           color: FCIColors.whiteColor()),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
  // init() {
  //   imageSliders = widget.networkImages
  //       .map((item) => Container(
  //     child: Container(
  //       margin: EdgeInsets.all(5.0),
  //       child: Container(
  //         width: FCISize.width(context)*0.25,
  //         height: FCISize.height(context)*0.2,
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage(
  //               item,
  //             ),
  //             fit: BoxFit.cover,
  //           ),
  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //         ),
  //       )
  //     ),
  //   ))
  //       .toList();
  // }

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              // enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 2.0,
              initialPage: active,
              reverse: true,
              onPageChanged: (index, reason) {
                setState(() {
                  active = index;
                });
              },
              height: ScreenUtil().setHeight(150)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...Iterable<int>.generate(widget.networkImages.length).map(
              (int pageIndex) => indicators(pageIndex),
            ),
          ],
        )
      ]);
  Widget indicators(currentIndex) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 25,
      height: 2.5,
      decoration: BoxDecoration(
          color: active == currentIndex ? Colors.black : Colors.black26,
          shape: BoxShape.rectangle),
    );
  }
}
