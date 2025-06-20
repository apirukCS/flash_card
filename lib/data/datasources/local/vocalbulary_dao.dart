import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:sqflite/sqflite.dart';

class VocabularyDao {
  final dbHelper = DatabaseHelper();

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
}
