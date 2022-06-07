import 'package:flutter/material.dart';

import '../../data/profile_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProfileData profileData = userProfileData;

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
          ],
        )),
      ),
    );
  }
}
