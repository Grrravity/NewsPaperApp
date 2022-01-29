import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImageWithTitle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final DateTime date;
  final double? borderRadius;
  final double width;
  final double height;

  ImageWithTitle._({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  factory ImageWithTitle.rounded({
    required String imageUrl,
    required String title,
    required DateTime date,
    required double width,
    required double height,
    double? borderRadius = 25,
  }) {
    return ImageWithTitle._(
      imageUrl: imageUrl,
      title: title,
      date: date,
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }

  factory ImageWithTitle.sharp({
    required String imageUrl,
    required String title,
    required DateTime date,
    required double width,
    required double height,
  }) {
    return ImageWithTitle._(
      imageUrl: imageUrl,
      title: title,
      date: date,
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset('assets/images/imagenotfound.png');
            },
          ),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                Text(title),
                const SizedBox(
                  height: 20,
                ),
                Text(DateFormat('dd/MM/yyyy HH:mm').format(date))
              ],
            )),
      ],
    );
  }
}
