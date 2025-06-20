import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';
import 'package:flutter/material.dart';

class VocabularyProvider extends ChangeNotifier {
  final VocabularyRepository _repository;
  
  List<VocabularyModel> _vocabularies = [];
  List<VocabularyModel> get vocabularies => _vocabularies;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  
  VocabularyModel? get currentVocabulary => 
    _vocabularies.isNotEmpty ? _vocabularies[_currentIndex] : null;

  VocabularyProvider(this._repository);

  Future<void> loadVocabulariesByLevel(int levelId) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _vocabularies = await _repository.getVocabulariesByLevel(levelId);
      _currentIndex = 0;
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void nextVocabulary() {
    if (_currentIndex < _vocabularies.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousVocabulary() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  Future<void> markAsMemorized(bool isMemorized) async {
    if (currentVocabulary != null) {
      await _repository.updateVocabularyProgress(
        currentVocabulary!.id, 
        isMemorized
      );
      notifyListeners();
    }
  }
}