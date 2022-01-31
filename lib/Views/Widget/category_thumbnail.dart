import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';

class CategoryThumbnail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double? borderRadius;
  final BoxFit? boxFit;

  CategoryThumbnail({
    required this.imageUrl,
    required this.title,
    this.borderRadius = 15,
    this.boxFit = BoxFit.cover,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: boxFit,
            ),
          ),
        ),
        Center(
          child: Container(
            width: 150,
            height: 25,
            color: UiConstants.primaryGrey.withOpacity(0.6),
            child: Center(
              child: Text(
                title,
                style: UiConstants.regularTextBold14
                    .copyWith(color: UiConstants.backgroundWhite),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
