import 'dart:developer';

import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/models/choice_model.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:sqflite/sqflite.dart';

class VocabularyDao {
  final dbHelper = DatabaseHelper();

  //vocabulary
  Future<void> insertVocabulary(VocabularyModel vocab) async {
    final db = await dbHelper.database;
    await db.insert(
      'vocabularies',
      vocab.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<VocabularyModel>> getAllVocabularies() async {
    final db = await dbHelper.database;
    final result = await db.query('vocabularies');
    return result.map((json) => VocabularyModel.fromJson(json)).toList();
  }

  //choices
  Future<void> insertChoice(ChoiceModel choice) async {
    try {
      final db = await dbHelper.database;
      await db.insert(
        'choices',
        choice.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      log("error: $e");
    }
  }
}
