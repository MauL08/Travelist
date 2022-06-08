import 'package:flutter/material.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:travelist/screens/places_detail_screen/places_detail_screen.dart';
import 'package:travelist/widgets/userappbar_widget/userappbar_widget.dart';

import '../../data/profile_model.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final ProfileData profileData = userProfileData;
  final List<dynamic> travelData = indonesiaTravelData;
  List foundedPlace = [];

  TextEditingController searchText = TextEditingController(text: '');
  String categoryFilter = '';

  @override
  initState() {
    foundedPlace = travelData;
    super.initState();
  }

  void filteredPlaces(String searchText) {
    List res = [];

    if (searchText.isEmpty) {
      res = travelData;
    } else {
      res = travelData
          .where((e) => e.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }

    setState(() {
      foundedPlace = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              userAppBarWidget(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: TextFormField(
                  onChanged: ((e) => setState(
                        () {
                          searchText = searchText;
                          filteredPlaces(e);
                        },
                      )),
                  controller: searchText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Place',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: foundedPlace.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            searchText.text == ''
                                ? 'Indonesia Places'
                                : 'Result for ${searchText.text}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: foundedPlace.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 265,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      margin: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            foundedPlace[index].posterImage,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                foundedPlace[index].name,
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
                                                    color:
                                                        Colors.yellow.shade700,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(foundedPlace[index]
                                                      .rating
                                                      .toString())
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
                                                      placeName:
                                                          travelData[index]
                                                              .name,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Show',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : const Text(
                        'Not Found',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
