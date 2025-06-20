import 'package:flash_card/data/models/quiz_question_model.dart';
import 'package:flash_card/data/models/quiz_result_model.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/domain/repositories/progress_repositiry.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';
import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  final VocabularyRepository _vocabularyRepo;
  final ProgressRepository _progressRepo;

  List<QuizQuestionModel> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<int> _selectedAnswers = [];
  bool _isCompleted = false;

  QuizProvider(this._vocabularyRepo, this._progressRepo);

  Future<void> generateQuiz(int levelId) async {
    final vocabularies = await _vocabularyRepo.getVocabulariesByLevel(levelId);
    _questions = _generateQuestions(vocabularies);
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedAnswers = List.filled(_questions.length, -1);
    _isCompleted = false;
    notifyListeners();
  }

  //ToDo
  List<QuizQuestionModel> _generateQuestions(
    List<VocabularyModel> vocabularies,
  ) {
    return [];
  }

  void selectAnswer(int answerIndex) {
    _selectedAnswers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  Future<QuizResultModel> completeQuiz() async {
    _calculateScore();
    _isCompleted = true;

    final result = QuizResultModel(
      id: 0,
      levelId: _questions.first.levelId ?? 0,
      userId: 'default_user',
      score: _score,
      totalQuestions: _questions.length,
      passed: _score >= 8,
      quizDate: DateTime.now(),
    );

    notifyListeners();
    return result;
  }

  //ToDo
  _calculateScore() {}
}
