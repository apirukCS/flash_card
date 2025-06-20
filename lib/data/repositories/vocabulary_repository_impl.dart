import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  final DatabaseHelper _databaseHelper;
  // final SharedPreferencesHelper _prefsHelper;

  // VocabularyRepositoryImpl(this._databaseHelper, this._prefsHelper);
  VocabularyRepositoryImpl(this._databaseHelper);

  @override
  Future<List<VocabularyModel>> getVocabulariesByLevel(int levelId) async {
    final db = await _databaseHelper.database;
    final result = await db.query(
      'vocabularies',
      where: 'level_id = ?',
      whereArgs: [levelId],
      orderBy: 'id ASC',
    );
    return result.map((json) => VocabularyModel.fromJson(json)).toList();
  }

  @override
  Future<List<VocabularyModel>> getRandomVocabularies(int count) {
    // TODO: implement getRandomVocabularies
    throw UnimplementedError();
  }

  @override
  Future<VocabularyModel> getVocabularyById(int id) {
    // TODO: implement getVocabularyById
    throw UnimplementedError();
  }

  @override
  Future<void> updateVocabularyProgress(int vocabularyId, bool isMemorized) {
    // TODO: implement updateVocabularyProgress
    throw UnimplementedError();
  }
}
