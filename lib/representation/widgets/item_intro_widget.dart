import 'package:flutter/material.dart';
import 'package:booking_app_source/core/constants/dimension_constants.dart';
import 'package:booking_app_source/core/constants/text_style_ext.dart';
import 'package:booking_app_source/core/helpers/image_helper.dart';

class ItemIntroWidget extends StatelessWidget {
  const ItemIntroWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.sourceImage,
    required this.alignment,
  }) : super(key: key);

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container( 
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            sourceImage,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
