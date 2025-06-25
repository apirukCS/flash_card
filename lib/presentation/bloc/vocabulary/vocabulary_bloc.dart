import 'package:equatable/equatable.dart';
import 'package:flash_card/data/models/choice_model.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final VocabularyRepository repo;
  VocabularyBloc(this.repo) : super(VocabularyState.initial()) {
    on<GetAllByLevel>((event, emit) async {
      var list = await repo.getVocabulariesByLevel(event.levelId);
      emit(state.copyWith(vocabularies: list));
    });

    on<UpdateCurrentIndex>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<GetChoicesByVocabId>((event, emit) async {
      var list = await repo.getChoicesByVocabId(event.vocabId);
      emit(state.copyWith(choices: list));
    });

    on<UpdateChoiceSelected>((event, emit) {
      emit(state.copyWith(choiceSelected: event.choice));
    });
  }
}
