import 'package:flutter/material.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/data/model/hotel_model.dart';
import 'package:booking_app_source/representation/screen/detail_hotel_screen.dart';
import 'package:booking_app_source/representation/widgets/app_bar_container.dart';
import 'package:booking_app_source/representation/widgets/item_hotel_widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  late List<HotelModel> listHotel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final destination = arguments?['destination'] as String?;
    final numberOfGuests = int.tryParse(arguments?['guests'] ?? '0');
    final numberOfRooms = int.tryParse(arguments?['rooms'] ?? '0');
    listHotel = getHotelsByDestination(destination ?? 'Vietnam', numberOfGuests ?? 1, numberOfRooms ?? 1);
  }

  List<HotelModel> getHotelsByDestination(String destination, int numberOfGuests, int numberOfRooms) {
    Map<String, List<HotelModel>> hotelData = {
      'Korea': [
        HotelModel(
          hotelImage: AssetHelper.hotel1,
          hotelName: 'Korea Hotel 1',
          location: 'Seoul, Korea',
          awayKilometer: '500 m',
          star: 4.5,
          numberOfReview: 2301,
          price: 200,
          availableRooms: 5,
          capacityPerRoom: 2,
          detailLocated: 'This is the detail location of Korea Hotel 1',
          detailInformation: 'This is the detail information of Korea Hotel 1',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel2,
          hotelName: 'Korea Hotel 2',
          location: 'Busan, Korea',
          awayKilometer: '1 km',
          star: 4.0,
          numberOfReview: 1500,
          price: 180,
          availableRooms: 3,
          capacityPerRoom: 3,
          detailLocated: 'This is the detail location of Korea Hotel 2',
          detailInformation: 'This is the detail information of Korea Hotel 2',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel3,
          hotelName: 'Korea Hotel 3',
          location: 'Incheon, Korea',
          awayKilometer: '2 km',
          star: 4.2,
          numberOfReview: 1800,
          price: 220,
          availableRooms: 7,
          capacityPerRoom: 4,
          detailLocated: 'This is the detail location of Korea Hotel 3',
          detailInformation: 'This is the detail information of Korea Hotel 3',
        ),
      ],
      'Dubai': [
        HotelModel(
          hotelImage: AssetHelper.hotel1,
          hotelName: 'Dubai Hotel 1',
          location: 'Dubai, UAE',
          awayKilometer: '2 km',
          star: 4.8,
          numberOfReview: 3200,
          price: 350,
          availableRooms: 4,
          capacityPerRoom: 2,
          detailLocated: 'This is the detail location of Dubai Hotel 1',
          detailInformation: 'This is the detail information of Dubai Hotel 1',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel2,
          hotelName: 'Dubai Hotel 2',
          location: 'Dubai, UAE',
          awayKilometer: '500 m',
          star: 4.3,
          numberOfReview: 2400,
          price: 300,
          availableRooms: 6,
          capacityPerRoom: 3,
          detailLocated: 'This is the detail location of Dubai Hotel 2',
          detailInformation: 'This is the detail information of Dubai Hotel 2',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel3,
          hotelName: 'Dubai Hotel 3',
          location: 'Abu Dhabi, UAE',
          awayKilometer: '3 km',
          star: 4.7,
          numberOfReview: 3100,
          price: 340,
          availableRooms: 8,
          capacityPerRoom: 4,
          detailLocated: 'This is the detail location of Dubai Hotel 3',
          detailInformation: 'This is the detail information of Dubai Hotel 3',
        ),
      ],
      'Turkey': [
        HotelModel(
          hotelImage: AssetHelper.hotel1,
          hotelName: 'Turkey Hotel 1',
          location: 'Istanbul, Turkey',
          awayKilometer: '1 km',
          star: 4.4,
          numberOfReview: 2100,
          price: 180,
          availableRooms: 5,
          capacityPerRoom: 2,
          detailLocated: 'This is the detail location of Turkey Hotel 1',
          detailInformation: 'This is the detail information of Turkey Hotel 1',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel2,
          hotelName: 'Turkey Hotel 2',
          location: 'Ankara, Turkey',
          awayKilometer: '2 km',
          star: 4.6,
          numberOfReview: 2500,
          price: 200,
          availableRooms: 3,
          capacityPerRoom: 3,
          detailLocated: 'This is the detail location of Turkey Hotel 2',
          detailInformation: 'This is the detail information of Turkey Hotel 2',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel3,
          hotelName: 'Turkey Hotel 3',
          location: 'Antalya, Turkey',
          awayKilometer: '3 km',
          star: 4.5,
          numberOfReview: 2300,
          price: 220,
          availableRooms: 6,
          capacityPerRoom: 4,
          detailLocated: 'This is the detail location of Turkey Hotel 3',
          detailInformation: 'This is the detail information of Turkey Hotel 3',
        ),
      ],
      'Japan': [
        HotelModel(
          hotelImage: AssetHelper.hotel1,
          hotelName: 'Japan Hotel 1',
          location: 'Tokyo, Japan',
          awayKilometer: '1 km',
          star: 4.7,
          numberOfReview: 2800,
          price: 250,
          availableRooms: 4,
          capacityPerRoom: 2,
          detailLocated: 'This is the detail location of Japan Hotel 1',
          detailInformation: 'This is the detail information of Japan Hotel 1',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel2,
          hotelName: 'Japan Hotel 2',
          location: 'Osaka, Japan',
          awayKilometer: '2 km',
          star: 4.5,
          numberOfReview: 2600,
          price: 230,
          availableRooms: 7,
          capacityPerRoom: 3,
          detailLocated: 'This is the detail location of Japan Hotel 2',
          detailInformation: 'This is the detail information of Japan Hotel 2',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel3,
          hotelName: 'Japan Hotel 3',
          location: 'Kyoto, Japan',
          awayKilometer: '3 km',
          star: 4.6,
          numberOfReview: 2700,
          price: 240,
          availableRooms: 5,
          capacityPerRoom: 4,
          detailLocated: 'This is the detail location of Japan Hotel 3',
          detailInformation: 'This is the detail information of Japan Hotel 3',
        ),
      ],
      'Vietnam': [
        HotelModel(
          hotelImage: AssetHelper.hotel1,
          hotelName: 'Vietnam Hotel 1',
          location: 'Hanoi, Vietnam',
          awayKilometer: '1 km',
          star: 4.3,
          numberOfReview: 2200,
          price: 150,
          availableRooms:      8,
          capacityPerRoom: 2,
          detailLocated: 'This is the detail location of Vietnam Hotel 1',
          detailInformation: 'This is the detail information of Vietnam Hotel 1',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel2,
          hotelName: 'Vietnam Hotel 2',
          location: 'Ho Chi Minh City, Vietnam',
          awayKilometer: '2 km',
          star: 4.4,
          numberOfReview: 2400,
          price: 160,
          availableRooms: 6,
          capacityPerRoom: 3,
          detailLocated: 'This is the detail location of Vietnam Hotel 2',
          detailInformation: 'This is the detail information of Vietnam Hotel 2',
        ),
        HotelModel(
          hotelImage: AssetHelper.hotel3,
          hotelName: 'Vietnam Hotel 3',
          location: 'Da Nang, Vietnam',
          awayKilometer: '3 km',
          star: 4.5,
          numberOfReview: 2500,
          price: 170,
          availableRooms: 4,
          capacityPerRoom: 4,
          detailLocated: 'This is the detail location of Vietnam Hotel 3',
          detailInformation: 'This is the detail information of Vietnam Hotel 3',
        ),
      ],
    };



    // Lọc các khách sạn theo số lượng phòng còn lại và số lượng khách cần
    List<HotelModel> filteredHotels = [];
    final List<HotelModel>? hotels = hotelData[destination];
    if (hotels != null) {
      for (final hotel in hotels) {
        if (hotel.availableRooms >= numberOfRooms && hotel.capacityPerRoom * numberOfRooms >= numberOfGuests) {
          filteredHotels.add(hotel);
        }
      }
    }

    return filteredHotels;
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementTraveling: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: listHotel
              .map(
                (e) => ItemHotelWidget(
                  hotelModel: e,
                 onTap: () {
                    Navigator.of(context).pushNamed(DetailHotelScreen.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
