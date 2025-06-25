part of 'vocabulary_bloc.dart';

class VocabularyEvent {}

class GetAllByLevel extends VocabularyEvent {
  final int levelId;
  GetAllByLevel({required this.levelId});
}

class UpdateCurrentIndex extends VocabularyEvent {
  final int index;
  UpdateCurrentIndex({required this.index});
}

class GetChoicesByVocabId extends VocabularyEvent {
  final int vocabId;
  GetChoicesByVocabId({required this.vocabId});
}

class UpdateChoiceSelected extends VocabularyEvent {
  final ChoiceModel? choice;
  UpdateChoiceSelected({required this.choice});
}
