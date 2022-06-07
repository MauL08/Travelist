import 'package:flutter/material.dart';
import 'package:travelist/data/travel_model.dart';

import '../../data/profile_model.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key? key}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final ProfileData profileData = userProfileData;

  final List<dynamic> travelData = allTravelData;

  final category = travelCategory;

  TextEditingController searchText = TextEditingController(text: '');
  String categoryFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Akbar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.blue.shade700,
                            ),
                            Text(
                              'Jakarta, Indonesia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.grey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            child: ClipOval(
                              child: Image.asset(
                                profileData.profileImage,
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: TextFormField(
                  onChanged: ((e) => setState(
                        () {
                          searchText = searchText;
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
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                height: 40,
                width: double.infinity,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        if (category[index] == 'All') {
                          setState(() {
                            categoryFilter = '';
                          });
                        } else {
                          setState(() {
                            categoryFilter = category[index];
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          category[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF177FE4),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const VerticalDivider(
                      width: 10,
                      color: Colors.transparent,
                    );
                  },
                  itemCount: category.length,
                ),
              ),
              travelListBuilder(context, categoryFilter, searchText.text),
            ],
          ),
        ),
      ),
    );
  }
}

Widget travelListBuilder(BuildContext context, String category, String search) {
  final List<dynamic> travelData = allTravelData;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Viewing ${category == '' ? 'All' : category} Places',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: travelData.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(travelData[index].name),
              );
            })
      ],
    ),
  );
}
