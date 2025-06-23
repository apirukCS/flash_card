import 'package:flash_card/data/models/vocabulary_model.dart';

abstract class VocabularyRepository {
  Future<List<VocabularyModel>> getVocabulariesByLevel(int levelId);
  Future<VocabularyModel> getVocabularyById(int id);
  Future<List<VocabularyModel>> getRandomVocabularies(int count);
  Future<void> updateVocabularyProgress(int vocabularyId, bool isMemorized);
}
