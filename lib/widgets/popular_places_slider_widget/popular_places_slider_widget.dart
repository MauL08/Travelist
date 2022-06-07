import 'package:flutter/material.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelist/screens/places_detail_screen/places_detail_screen.dart';

class PopularPlacesSlider extends StatefulWidget {
  PopularPlacesSlider({Key? key}) : super(key: key);

  @override
  State<PopularPlacesSlider> createState() => _PopularPlacesSliderState();
}

class _PopularPlacesSliderState extends State<PopularPlacesSlider> {
  final List<dynamic> travelData = allTravelData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: travelData.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            width: 240,
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 240,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        travelData[index].posterImage,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelData[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                              const SizedBox(width: 4),
                              Text(travelData[index].rating.toString())
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PlacesDetailScreen(
                                  placeName: travelData[index].name,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Show',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
