import 'package:flutter/material.dart';

import 'package:booking_app_source/core/constants/dimension_constants.dart';
import 'package:booking_app_source/core/constants/text_style_ext.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/core/helpers/image_helper.dart';
import 'package:booking_app_source/data/model/hotel_model.dart';
import 'package:booking_app_source/representation/widgets/dash_line.dart';
import 'package:booking_app_source/representation/widgets/item_button_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({
    Key? key,
    required this.hotelModel,
    this.onTap,
  }) : super(key: key);

  final HotelModel hotelModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoLocationBlank,
                    ),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                    ),
                    Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoStar,
                    ),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: TextStyles.defaultStyle.fontHeader.bold,
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          Text(
                            '/night',
                            style: TextStyles.defaultStyle.fontCaption,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ItemButtonWidget(
                        data: 'Book a room',
                        onTap: onTap,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
