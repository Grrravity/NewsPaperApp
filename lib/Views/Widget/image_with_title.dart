import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';

class ImageWithTitle extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final DateTime? date;
  final double? borderRadius;
  final double width;
  final double height;
  final BoxFit? boxFit;

  ImageWithTitle._({
    required this.imageUrl,
    required this.width,
    required this.height,
    this.title,
    this.date,
    this.borderRadius,
    this.boxFit,
  });

  factory ImageWithTitle.rounded({
    required String imageUrl,
    required double width,
    required double height,
    String? title,
    DateTime? date,
    BoxFit? boxFit = BoxFit.fill,
    double? borderRadius = 25,
  }) {
    return ImageWithTitle._(
      imageUrl: imageUrl,
      title: title,
      date: date,
      width: width,
      height: height,
      borderRadius: borderRadius,
      boxFit: boxFit,
    );
  }

  factory ImageWithTitle.sharp({
    required String imageUrl,
    required double width,
    required double height,
    String? title,
    DateTime? date,
    BoxFit? boxFit = BoxFit.fill,
  }) {
    return ImageWithTitle._(
      imageUrl: imageUrl,
      width: width,
      height: height,
      title: title,
      date: date,
      boxFit: boxFit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            child: Image.network(
              imageUrl,
              fit: boxFit,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: LinearProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/imagenotfound.png',
                  fit: boxFit,
                );
              },
            ),
          ),
        ),
        //Positioned(
        //  bottom: 0,
        //  left: 0,
        //  child: Container(
        //    height: 80,
        //    width: width,
        //    color: UiConstants.primaryBlack.withOpacity(0.4),
        //  ),
        //),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 95,
              width: width,
              color: title != null || date != null
                  ? UiConstants.primaryBlack.withOpacity(0.4)
                  : Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      SizedBox(
                        width: width - 40,
                        child: Text(
                          title!,
                          style: UiConstants.h3Bold
                              .copyWith(color: UiConstants.backgroundWhite),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    if (title != null || date != null)
                      const SizedBox(
                        height: 8,
                      ),
                    if (date != null)
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(date!),
                        style: UiConstants.regularTextBold14
                            .copyWith(color: UiConstants.backgroundWhite),
                      )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
