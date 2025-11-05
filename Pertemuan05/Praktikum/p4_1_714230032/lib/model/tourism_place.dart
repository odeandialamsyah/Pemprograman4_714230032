class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Ranca Upas',
    location: 'Ciwidey',
    description:
        'Ranca Upas Ciwidey adalah bumi perkemahan dan tempat wisata alam di Bandung Selatan...',
    openDays: 'Open Everyday',
    openTime: '07.00 - 17.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://www.rancaupas.id/wp-content/uploads/2022/09/DSC05254-2-1024x683.jpg',
      'https://www.rancaupas.id/wp-content/uploads/2023/08/Ranca-Upas-Igloo-Camp-Ciwidey.jpg',
      'https://awsimages.detik.net.id/community/media/visual/2020/11/11/ranca-upas_169.jpeg?w=1200',
    ],
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang',
    description:
        'Observatorium Bosscha merupakan observatorium astronomi tertua di Indonesia...',
    openDays: 'Senin - Jumat',
    openTime: '09.00 - 14.00',
    ticketPrice: 'Rp 15.000',
    imageAsset: 'images/bosscha.jpg',
    imageUrls: [
      'https://www.bosscha.itb.ac.id/wp-content/uploads/2023/01/observatorium-bosscha-1.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/2/27/Bosscha_Observatory_2015.jpg',
    ],
  ),
];
