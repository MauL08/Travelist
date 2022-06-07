import 'package:flutter/material.dart';
import 'package:travelist/data/travel_category_model.dart';
import 'package:travelist/widgets/home_image_slider/home_image_slider.dart';
import 'package:travelist/widgets/popular_places_slider_widget/popular_places_slider_widget.dart';
import 'package:travelist/widgets/userappbar_widget/userappbar_widget.dart';

import '../../data/profile_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProfileData profileData = userProfileData;
  final List<TravelCategory> category = categoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              userAppBarWidget(),
              HomeImageSlider(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 28),
                height: 100,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.lightBlue.shade300,
                            ),
                            child: Image.asset(
                              category[index + 1].flagLogo,
                              height: 40,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          category[index + 1].categoryName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const VerticalDivider(
                      width: 12,
                      color: Colors.transparent,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length - 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Places',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.blue.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              PopularPlacesSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
