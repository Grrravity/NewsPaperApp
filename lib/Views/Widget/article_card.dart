import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';
import 'package:newspaperapp/Model/Database/database_model.dart';

import 'image_with_title.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;
  final double? borderRadius;
  final double width;
  final double height;

  /// Article card with image and basic information
  /// ```dart
  /// ArticleCard.simple(
  ///   article: Articles(),
  ///   width: size.width,
  ///   height: 100),
  /// ),
  /// ```
  ArticleCard._({
    required this.article,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  factory ArticleCard.simple({
    required Articles article,
    required double width,
    required double height,
    double? borderRadius = 25,
  }) {
    return ArticleCard._(
      article: article,
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          ImageWithTitle.rounded(
            borderRadius: 12,
            width: height,
            height: height,
            imageUrl: article.urlToImage ?? '',
            boxFit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: width - height - 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.title ?? '',
                  style: UiConstants.regularTextBold14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  article.description ?? '',
                  style: UiConstants.regularText12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  article.publishedAt != null
                      ? DateFormat('dd/MM/yyyy HH:mm')
                          .format(article.publishedAt!)
                      : '-',
                  style: UiConstants.regularText12Grey
                      .copyWith(fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
