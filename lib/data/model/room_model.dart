class RoomModel {
  RoomModel({
    required this.roomImage,
    required this.roomName,
    required this.utility,
    required this.size,
    required this.price,
    required this.person, 
  });

  final String roomImage;
  final String roomName;
  final String utility;
  final int size;
  final int price;
  final int person; 
}
