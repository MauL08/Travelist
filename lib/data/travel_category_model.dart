class TravelCategory {
  String flagLogo;
  String categoryName;

  TravelCategory({
    required this.flagLogo,
    required this.categoryName,
  });
}

var categoryList = [
  TravelCategory(flagLogo: '', categoryName: 'All'),
  TravelCategory(
      flagLogo: 'assets/images/indonesiaFlag.png', categoryName: 'Indonesia'),
  TravelCategory(flagLogo: 'assets/images/usFlag.png', categoryName: 'America'),
  TravelCategory(
      flagLogo: 'assets/images/englandFlag.webp', categoryName: 'England'),
  TravelCategory(
      flagLogo: 'assets/images/europeFlag.png', categoryName: 'Europe'),
];
