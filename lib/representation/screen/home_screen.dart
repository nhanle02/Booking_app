import 'package:flutter/material.dart';
import 'package:booking_app_source/core/constants/text_style_ext.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/core/helpers/image_helper.dart';
import 'package:booking_app_source/representation/screen/hotel_booking_screen.dart';
import 'package:booking_app_source/representation/widgets/app_bar_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:booking_app_source/pages/login_page.dart';

import '../../core/constants/dimension_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.korea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
    },
  ];

  Widget _buildItemCategory(Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            child: icon,
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(kItemPadding)),
          ),
          const SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget _buildImageHomScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = AuThen.currentUser; // Get the current user

    return AppBarContainer(
      titleString: 'home',
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi ${currentUser?['fullName'] ?? 'User'} !', // Display the full name
                  style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
          ],
        ),
      ),
      implementLeading: false,
      child: Column(
        children: [
          TextField(
            enabled: true,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kItemPadding,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
            style: TextStyles.defaultStyle,
            onChanged: (value) {},
            onSubmitted: (String submitValue) {},
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoHotel,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  const Color(0xffFE9C5E),
                  () {
                    Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                  },
                  'Hotels'
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoPlane,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  const Color(0xffF77777),
                  () {},
                  'Flights'
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoHotelPlane,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  const Color(0xff3EC8BC),
                  () {},
                  'All'
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Text(
                'Popular Destinations',
                style: TextStyles.defaultStyle.bold,
              ),
              const Spacer(),
              Text(
                'See All',
                style: TextStyles.defaultStyle.bold.primaryTextColor,
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: listImageLeft
                          .map(
                            (e) => _buildImageHomScreen(
                              e['name']!,
                              e['image']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: listImageRight
                          .map(
                            (e) => _buildImageHomScreen(
                              e['name']!,
                              e['image']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
