import 'package:flutter/material.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlacesDetailScreen extends StatefulWidget {
  const PlacesDetailScreen({Key? key, required this.placeName})
      : super(key: key);

  final String placeName;

  @override
  State<PlacesDetailScreen> createState() => _PlacesDetailScreenState();
}

class _PlacesDetailScreenState extends State<PlacesDetailScreen> {
  final List<dynamic> travelData = indonesiaTravelData;
  List detailedPlace = [];

  int dotIndex = 0;
  var favColorChange = false;

  @override
  initState() {
    detailedPlace = travelData;
    super.initState();
  }

  void getDetailedPlace(String text) {
    List res = [];

    res = travelData.where((e) => e.name.contains(text)).toList();

    setState(() {
      detailedPlace = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    getDetailedPlace(widget.placeName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.placeName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    itemCount: detailedPlace[0].bannerImage.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        detailedPlace[0].bannerImage[index],
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
                      count: detailedPlace[0].bannerImage.length,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.yellow.shade700,
                    ),
                    const SizedBox(width: 4),
                    Text(detailedPlace[0].rating.toString()),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          favColorChange = !favColorChange;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 24,
                        color: favColorChange ? Colors.red : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text('Set as Favorite')
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Text(
                detailedPlace[0].about,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                'More Images for ${detailedPlace[0].name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    itemCount: detailedPlace[0].gallery.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        detailedPlace[0].gallery[index],
                        fit: BoxFit.cover,
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
