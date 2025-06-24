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
