class ProfileData {
  final String name;
  final String profileImage;
  final List favorites;
  final String bornDate;
  final int age;

  const ProfileData({
    required this.name,
    required this.profileImage,
    required this.favorites,
    required this.bornDate,
    required this.age,
  });
}

const userProfileData = ProfileData(
  name: 'Akbar Maulana',
  profileImage: 'assets/images/profile.jpg',
  favorites: [],
  bornDate: '23 Agustus 2002',
  age: 19,
);
