import 'package:flutter/material.dart';
import 'package:travelist/data/travel_category_model.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:travelist/widgets/userappbar_widget/userappbar_widget.dart';

import '../../data/profile_model.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key? key}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final ProfileData profileData = userProfileData;
  final List<dynamic> travelData = allTravelData;
  final List<TravelCategory> travelCategoryData = categoryList;

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                height: 40,
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        // if (travelCategoryData[index].categoryName == 'All') {
                        //   setState(() {
                        //     categoryFilter = '';
                        //   });
                        // } else {
                        //   setState(() {
                        //     categoryFilter =
                        //         travelCategoryData[index].categoryName;
                        //   });
                        // }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          travelCategoryData[index].categoryName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF177FE4),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const VerticalDivider(
                      width: 10,
                      color: Colors.transparent,
                    );
                  },
                  itemCount: travelCategoryData.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: foundedPlace.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Viewing ${categoryFilter == '' ? 'All' : categoryFilter} Places',
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
                                            onPressed: () {},
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
