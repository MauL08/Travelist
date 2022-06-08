import 'package:flutter/material.dart';
import 'package:travelist/data/profile_model.dart';
import 'package:travelist/data/travel_model.dart';
import 'package:travelist/screens/places_detail_screen/places_detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileData profileData = userProfileData;
  final List<dynamic> travelTest = indonesiaTravelData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade800,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Your Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      profileData.bannerProfileImage,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: ClipOval(
                          child: Image.asset(
                            profileData.profileImage,
                            height: 180,
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 220,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF177FE4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Name :',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              profileData.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF177FE4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Birth Date :',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              profileData.bornDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF177FE4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Age :',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${profileData.age.toString()} Years Old',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Favorite Places',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 280,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: profileData.favorites.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 300,
                      margin: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 300,
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  profileData.favorites[index].posterImage,
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
                                      profileData.favorites[index].name,
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
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          profileData.favorites[index].rating
                                              .toString(),
                                        )
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
