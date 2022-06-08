import 'package:flutter/material.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeImageSlider extends StatefulWidget {
  const HomeImageSlider({Key? key}) : super(key: key);

  @override
  State<HomeImageSlider> createState() => _HomeImageSliderState();
}

class _HomeImageSliderState extends State<HomeImageSlider> {
  final List<dynamic> travelData = indonesiaTravelData;
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CarouselSlider.builder(
            itemCount: travelData.length,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                travelData[index].posterImage,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  setState(() {
                    dotIndex = index;
                  });
                }),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: AnimatedSmoothIndicator(
              effect: SlideEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 18.0,
                dotHeight: 12.0,
                strokeWidth: 1.5,
                dotColor: Colors.blue.shade900,
                activeDotColor: Colors.lightBlue.shade300,
              ),
              activeIndex: dotIndex,
              count: travelData.length,
            ),
          )
        ],
      ),
    );
  }
}
