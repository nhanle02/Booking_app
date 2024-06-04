import 'package:flutter/material.dart';
import 'package:booking_app_source/data/model/room_model.dart';
import 'package:booking_app_source/representation/screen/check_out_screen.dart';
import 'package:booking_app_source/representation/widgets/item_room_widget.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';


class RoomsScreen extends StatefulWidget {
 const RoomsScreen({Key? key}) : super(key: key);


 static const String routeName = '/rooms_screen';


 @override
 State<RoomsScreen> createState() => _RoomsScreenState();
}


class _RoomsScreenState extends State<RoomsScreen> {
 late List<RoomModel> listRoom;


 final Map<String, List<RoomModel>> hotelRooms = {
   'Vietnam Hotel 1': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 20,
       utility: 'Free Wi-Fi',
       price: 100,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 30,
       utility: 'Free Breakfast',
       price: 150,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 40,
       utility: 'Free Airport Transfer',
       price: 200,
       person: 3,
     ),
   ],
   'Vietnam Hotel 2': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 22,
       utility: 'Free Wi-Fi',
       price: 110,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 32,
       utility: 'Free Breakfast',
       price: 160,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 42,
       utility: 'Free Airport Transfer',
       price: 210,
       person: 3,
     ),
   ],
   'Vietnam Hotel 3': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Korea Hotel 1': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 23,
       utility: 'Free Wi-Fi',
       price: 105,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 33,
       utility: 'Free Breakfast',
       price: 155,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 43,
       utility: 'Free Airport Transfer',
       price: 205,
       person: 3,
     ),
   ],
   'Korea Hotel 2': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 25,
       utility: 'Free Wi-Fi',
       price: 115,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 35,
       utility: 'Free Breakfast',
       price: 165,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 45,
       utility: 'Free Airport Transfer',
       price: 215,
       person: 3,
     ),
   ],
   'Korea Hotel 3': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Japan Hotel 1': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 26,
       utility: 'Free Wi-Fi',
       price: 120,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 36,
       utility: 'Free Breakfast',
       price: 170,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 46,
       utility: 'Free Airport Transfer',
       price: 220,
       person: 3,
     ),
   ],
   'Japan Hotel 2': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Japan Hotel 3': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Dubai Hotel 1': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 26,
       utility: 'Free Wi-Fi',
       price: 120,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 36,
       utility: 'Free Breakfast',
       price: 170,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 46,
       utility: 'Free Airport Transfer',
       price: 220,
       person: 3,
     ),
   ],
   'Dubai Hotel 2': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Dubai Hotel 3': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Turkey Hotel 1': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 26,
       utility: 'Free Wi-Fi',
       price: 120,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 36,
       utility: 'Free Breakfast',
       price: 170,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 46,
       utility: 'Free Airport Transfer',
       price: 220,
       person: 3,
     ),
   ],
   'Turkey Hotel 2': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
   'Turkey Hotel 3': [
     RoomModel(
       roomImage: AssetHelper.room1,
       roomName: 'Single Room',
       size: 28,
       utility: 'Free Wi-Fi',
       price: 130,
       person: 1,
     ),
     RoomModel(
       roomImage: AssetHelper.room2,
       roomName: 'Double Room',
       size: 38,
       utility: 'Free Breakfast',
       price: 180,
       person: 2,
     ),
     RoomModel(
       roomImage: AssetHelper.room3,
       roomName: 'Suite Room',
       size: 48,
       utility: 'Free Airport Transfer',
       price: 230,
       person: 3,
     ),
   ],
 };


 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String? hotelName = ModalRoute.of(context)?.settings.arguments as String?;
    listRoom = hotelRooms[hotelName] ?? [];
  }

 @override
 Widget build(BuildContext context) {
   return AppBarContainer(
     titleString: 'Select room',
     child: SingleChildScrollView(
       child: Column(
         children: listRoom
             .map(
               (e) => ItemRoomWidget(
                 roomModel: e,
                 onTap: () {
                   Navigator.of(context).pushNamed(CheckOutScreen.routeName, arguments: e);
                 },
               ),
             )
             .toList(),
       ),
     ),
   );
 }
}



