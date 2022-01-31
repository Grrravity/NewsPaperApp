import 'package:newspaperapp/model/sources.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

const articles = SqfEntityTable(
    tableName: 'articles',
    modelName: 'Articles',
    primaryKeyName: 'uuid',
    primaryKeyType: PrimaryKeyType.text,
    fields: [
      SqfEntityField('author', DbType.text),
      SqfEntityField('title', DbType.text),
      SqfEntityField('description', DbType.text),
      SqfEntityField('url', DbType.text),
      SqfEntityField('urlToImage', DbType.text),
      SqfEntityField('publishedAt', DbType.datetime),
      SqfEntityField('content', DbType.text),
      SqfEntityField('created_at', DbType.datetime),
      SqfEntityField('updated_at', DbType.datetime),
      SqfEntityField('deleted_at', DbType.datetime),
      SqfEntityFieldRelationship(
          parentTable: sources,
          deleteRule: DeleteRule.CASCADE,
          fieldName: 'source_uuid',
          isNotNull: true),
    ]);
