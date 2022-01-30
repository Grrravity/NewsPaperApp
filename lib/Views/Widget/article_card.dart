import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newspaperapp/Core/constants/ui_constants.dart';
import 'package:newspaperapp/model/database/database_model.dart';

import 'image_with_title.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;
  final double? borderRadius;
  final double width;
  final double height;

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
            imageUrl: article.image_url ?? '',
            boxFit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.title ?? '-\r\n-',
                style: UiConstants.h5Bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                article.description ?? '-\r\n-',
                style: UiConstants.regularText14,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                article.published_at != null
                    ? DateFormat('dd/MM/yyyy HH:mm')
                        .format(article.published_at!)
                    : '-',
                style: UiConstants.regularText12
                    .copyWith(fontStyle: FontStyle.italic),
              )
            ],
          ),
        ],
      ),
    );
  }
}
