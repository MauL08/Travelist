import 'package:flutter/material.dart';
import 'package:travelist/widgets/home_image_slider/home_image_slider.dart';
import 'package:travelist/widgets/popular_places_slider_widget/popular_places_slider_widget.dart';
import 'package:travelist/widgets/userappbar_widget/userappbar_widget.dart';

import '../../data/profile_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProfileData profileData = userProfileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              userAppBarWidget(),
              const HomeImageSlider(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: const Text(
                  'Popular Places',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const PopularPlacesSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
