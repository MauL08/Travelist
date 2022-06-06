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

var allTravelData = [
  indonesiaTravelData,
  englandTravelData,
  americaTravelData,
  europeTravelData
].expand((e) => e).toList();

const indonesiaTravelData = [
  TravelData(
    name: 'Bali',
    about:
        'Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. East of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan.',
    posterImage: 'assets/images/indonesia/bali/poster/baliposter.jpg',
    bannerImage: [
      'assets/images/indonesia/bali/banner/balibanner1.jpg',
      'assets/images/indonesia/bali/banner/balibanner2.jpg',
      'assets/images/indonesia/bali/banner/balibanner3.jpg',
    ],
    rating: 9.2,
    category: 'Indonesia',
    gallery: [
      'assets/images/indonesia/bali/gallery/baligallery1.jpg',
      'assets/images/indonesia/bali/gallery/baligallery2.jpg',
      'assets/images/indonesia/bali/gallery/baligallery3.jpg',
      'assets/images/indonesia/bali/gallery/baligallery4.jpg',
      'assets/images/indonesia/bali/gallery/baligallery5.jpg',
    ],
  ),
  TravelData(
    name: 'Raja Ampat',
    about:
        'The Raja Ampat Islands are an Indonesian archipelago off the northwest tip of Bird’s Head Peninsula in West Papua. Comprising hundreds of jungle-covered islands, Raja Ampat is known for its beaches and coral reefs rich with marine life. Ancient rock paintings and caves are on Misool Island, while the crimson bird of paradise lives on Waigeo Island. Batanta and Salawati are the archipelago’s other main islands.',
    posterImage:
        'assets/images/indonesia/raja_ampat/poster/rajaampatposter.jpg',
    bannerImage: [
      'assets/images/indonesia/raja_ampat/banner/rajaampatbanner1.jpg',
      'assets/images/indonesia/raja_ampat/banner/rajaampatbanner2.jpg',
      'assets/images/indonesia/raja_ampat/banner/rajaampatbanner3.jpg',
    ],
    rating: 8.8,
    category: 'Indonesia',
    gallery: [
      'assets/images/indonesia/raja_ampat/gallery/rajaampatgallery1.jpg',
      'assets/images/indonesia/raja_ampat/gallery/rajaampatgallery2.jpg',
      'assets/images/indonesia/raja_ampat/gallery/rajaampatgallery3.jpg',
      'assets/images/indonesia/raja_ampat/gallery/rajaampatgallery4.jpg',
      'assets/images/indonesia/raja_ampat/gallery/rajaampatgallery5.jpg',
    ],
  ),
];

const englandTravelData = [];

const americaTravelData = [];

const europeTravelData = [];
