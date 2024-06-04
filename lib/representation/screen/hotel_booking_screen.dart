import 'package:flutter/material.dart';
import 'package:booking_app_source/core/constants/dimension_constants.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/representation/screen/guest_and_room_screen.dart';
import 'package:booking_app_source/representation/screen/hotels_screen.dart';
import 'package:booking_app_source/representation/screen/select_date_screen.dart';
import 'package:booking_app_source/representation/widgets/app_bar_container.dart';
import 'package:booking_app_source/representation/widgets/item_button_widget.dart';
import 'package:booking_app_source/representation/widgets/item_options_booking.dart';
import 'package:booking_app_source/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key, this.destination}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemOptionsBookingWidget(
              title: 'Destination',
              value: widget.destination ?? 'Viet Nam',
              icon: AssetHelper.icoLocation,
              onTap: () {},
            ),
            ItemOptionsBookingWidget(
              title: 'Select Date',
              value: selectDate ?? 'Select date',
              icon: AssetHelper.icoCalendal,
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            ItemOptionsBookingWidget(
              title: 'Guest and Room',
              value: guestAndRoom ?? 'Guest and Room',
              icon: AssetHelper.icoBed,
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            ItemButtonWidget(
              data: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(
                  HotelsScreen.routeName,
                  arguments: {
                    'destination': widget.destination,
                    'guests': guestAndRoom?.split(' ')[0], // Trả về số lượng khách
                    'rooms': guestAndRoom?.split(' ')[2], // Trả về số lượng phòng
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

