import 'package:flutter/material.dart';
import 'package:travelist/data/profile_model.dart';

Widget userAppBarWidget() {
  final ProfileData profileData = userProfileData;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                const Text(
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
        ClipOval(
          child: Image.asset(
            profileData.profileImage,
            height: 30,
            width: 30,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}
