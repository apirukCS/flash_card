part of 'vocabulary_bloc.dart';

class VocabularyState extends Equatable {
  final List<VocabularyModel> vocabularies;
  final int? currentIndex;
  const VocabularyState({required this.vocabularies, this.currentIndex});

  const VocabularyState.initial() : vocabularies = const [], currentIndex = 0;

  VocabularyState copyWith({
    List<VocabularyModel>? vocabularies,
    int? currentIndex,
  }) {
    return VocabularyState(
      vocabularies: vocabularies ?? this.vocabularies,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [vocabularies, currentIndex];
}
