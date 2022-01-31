import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

import 'database_export.dart';

part 'database_model.g.dart';

@SqfEntityBuilder(newsDb)
const newsDb = SqfEntityModel(
  modelName: 'DB',
  databaseName: 'newsDb.db',
  databaseTables: [
    articles,
    sources,
  ],
);
