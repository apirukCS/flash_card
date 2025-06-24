import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';

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
      log("event.index ${event.index}");
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
