import 'package:flutter/material.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/data/model/hotel_model.dart';
import 'package:booking_app_source/representation/widgets/dash_line.dart';
import 'package:booking_app_source/representation/widgets/item_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/constants/text_style_ext.dart';
import 'rooms_screen.dart';

class DetailHotelScreen extends StatefulWidget {
  static const String routeName = '/detail_hotel_screen';

  const DetailHotelScreen({
    Key? key,
    required this.hotelModel,
  }) : super(key: key);

  final HotelModel hotelModel;

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(kItemPadding),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultPadding,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(kItemPadding),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultPadding,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kItemPadding),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.hotelModel.hotelName,
                                    style: TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${widget.hotelModel.price.toString()}',
                                    style: TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                  Text(
                                    ' /night',
                                    style: TextStyles.defaultStyle.fontCaption,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AssetHelper.icoLocationBlank,
                                  ),
                                  const SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    widget.hotelModel.location,
                                  ),
                                  Text(
                                    ' - ${widget.hotelModel.awayKilometer} from destination',
                                    style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                                  ),
                                ],
                              ),
                              const DashLineWidget(),
                              Row(
                                children: [
                                  Image.asset(
                                    AssetHelper.icoStar,
                                  ),
                                  const SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    widget.hotelModel.star.toString(),
                                  ),
                                  Text(
                                    ' (${widget.hotelModel.numberOfReview} reviews)',
                                    style: TextStyles.defaultStyle.subTitleTextColor,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See All',
                                    style: TextStyles.defaultStyle.bold.primaryTextColor,
                                  ),
                                ],
                              ),
                              const DashLineWidget(),
                              Text(
                                'Information',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                widget.hotelModel.detailInformation,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                'Location',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                widget.hotelModel.detailLocated,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Image.asset(
                                AssetHelper.imageMap,
                                width: double.infinity,
                              ),
                              const SizedBox(
                                height: kMediumPadding,
                              ),
                              ItemButtonWidget(
                                  data: 'Select Room',
                                  onTap: () {
                                    Navigator.of(context).pushNamed(RoomsScreen.routeName,  arguments: widget.hotelModel.hotelName,);
                                  }),
                              const SizedBox(
                                height: kMediumPadding,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

