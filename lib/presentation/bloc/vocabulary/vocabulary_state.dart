part of 'vocabulary_bloc.dart';

class VocabularyState extends Equatable {
  final List<VocabularyModel> vocabularies;
  final int? currentIndex;
  final List<ChoiceModel>? choices;

  final ChoiceModel? choiceSelected;

  const VocabularyState({
    required this.vocabularies,
    this.currentIndex,
    this.choices,
    this.choiceSelected,
  });

  const VocabularyState.initial()
    : vocabularies = const [],
      currentIndex = 0,
      choiceSelected = null,
      choices = const [];

  VocabularyState copyWith({
    List<VocabularyModel>? vocabularies,
    int? currentIndex,
    List<ChoiceModel>? choices,
    ChoiceModel? choiceSelected,
  }) {
    return VocabularyState(
      vocabularies: vocabularies ?? this.vocabularies,
      currentIndex: currentIndex ?? this.currentIndex,
      choices: choices ?? this.choices,
      choiceSelected:
          choiceSelected != null
              ? choiceSelected.id != null
                  ? choiceSelected
                  : null
              : this.choiceSelected,
    );
  }

  @override
  List<Object?> get props => [
    vocabularies,
    currentIndex,
    choices,
    choiceSelected,
  ];
}
