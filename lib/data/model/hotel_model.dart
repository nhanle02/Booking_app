class HotelModel {
  HotelModel({
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.numberOfReview,
    required this.price,
    required this.availableRooms,
    required this.capacityPerRoom,
    this.detailLocated = '',
    this.detailInformation = '',
  });

  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final int price;
  final int availableRooms;
  final int capacityPerRoom;
  final String detailLocated;
  final String detailInformation;
}
