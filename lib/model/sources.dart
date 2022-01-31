import 'package:sqfentity_gen/sqfentity_gen.dart';

const sources = SqfEntityTable(
    tableName: 'sources',
    modelName: 'Sources',
    primaryKeyName: 'uuid',
    primaryKeyType: PrimaryKeyType.text,
    fields: [
      SqfEntityField('id', DbType.text),
      SqfEntityField('name', DbType.text),
      SqfEntityField('created_at', DbType.datetime),
      SqfEntityField('updated_at', DbType.datetime),
      SqfEntityField('deleted_at', DbType.datetime),
    ]);
