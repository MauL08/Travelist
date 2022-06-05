import 'package:flutter/material.dart';
import 'package:travelist/data/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final ProfileData profileData = userProfileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                profileData.profileImage,
                height: 100,
                width: 100,
              ),
            ),
            Text(profileData.name),
            Text(profileData.bornDate),
            Text(profileData.age.toString()),
          ],
        ),
      ),
    );
  }
}
