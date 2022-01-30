import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get_connect.dart';
import 'package:newspaperapp/Core/Failure/infrastructure_failure.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_repository.dart';
import 'package:newspaperapp/Model/Database/database_model.dart';

class TopRepositoryImpl extends RestApiRepository {
  TopRepositoryImpl({
    required GetHttpClient client,
  }) : super(client: client, controller: '/top-headlines');

  ///Get articles from top-headlines. return only first 50, france-related results.
  Future<Either<InfrastructureValueFailure<String>, List<Articles>>>
      getTopArticles({
    bool showError = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, dynamic> defaultQuery = {
        'country': 'fr',
        'pageSize': '50',
      };
      if (queryParameters != null) {
        queryParameters.addAll(defaultQuery);
      } else {
        queryParameters = defaultQuery;
      }
      return await handlingGetResponse(
              queryRoute: controller,
              queryParameters: queryParameters,
              showError: showError)
          .then(
        (either) => either.fold(
          (l) => left(l),
          (r) async {
            List<Articles> articles = [];
            articles.clear();
            try {
              var _articles = await Articles.fromJson(json.encode(r));
              articles.addAll(_articles);
            } catch (e) {
              return left(catchSerializationError(e));
            }
            return right(articles);
          },
        ),
      );
    } on Response catch (e) {
      return left(catchResponseError(e));
    } catch (e) {
      return left(catchSerializationError(e));
    }
  }
}
