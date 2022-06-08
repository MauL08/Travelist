class TravelData {
  final String name;
  final String about;
  final String posterImage;
  final List bannerImage; // 2 Images
  final num rating;
  final String category;
  final List gallery; // 5 Images

  const TravelData({
    required this.name,
    required this.about,
    required this.posterImage,
    required this.bannerImage,
    required this.rating,
    required this.category,
    required this.gallery,
  });
}

const indonesiaTravelData = [
  TravelData(
    name: 'Bali',
    about:
        'Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. East of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan.',
    posterImage: 'assets/images/baliposter.jpg',
    bannerImage: [
      'assets/images/balibanner1.jpg',
      'assets/images/balibanner2.jpg',
      'assets/images/balibanner3.jpg',
    ],
    rating: 9.2,
    category: 'Indonesia',
    gallery: [
      'assets/images/baligallery1.jpg',
      'assets/images/baligallery2.jpg',
      'assets/images/baligallery3.jpg',
      'assets/images/baligallery4.jpg',
      'assets/images/baligallery5.jpg',
    ],
  ),
  TravelData(
    name: 'Raja Ampat',
    about:
        'The Raja Ampat Islands are an Indonesian archipelago off the northwest tip of Bird’s Head Peninsula in West Papua. Comprising hundreds of jungle-covered islands, Raja Ampat is known for its beaches and coral reefs rich with marine life. Ancient rock paintings and caves are on Misool Island, while the crimson bird of paradise lives on Waigeo Island. Batanta and Salawati are the archipelago’s other main islands.',
    posterImage: 'assets/images/rajaampatposter.jpg',
    bannerImage: [
      'assets/images/rajaampatbanner1.jpg',
      'assets/images/rajaampatbanner2.jpg',
      'assets/images/rajaampatbanner3.jpg',
    ],
    rating: 8.8,
    category: 'Indonesia',
    gallery: [
      'assets/images/rajaampatgallery1.jpg',
      'assets/images/rajaampatgallery2.jpg',
      'assets/images/rajaampatgallery3.jpg',
      'assets/images/rajaampatgallery4.jpg',
      'assets/images/rajaampatgallery5.jpg',
    ],
  ),
];
