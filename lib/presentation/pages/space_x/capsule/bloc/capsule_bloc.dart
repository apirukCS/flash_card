import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flash_card/data/models/space_x/capsule_model.dart';
import 'package:flash_card/domain/repositories/space_x/capsule_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'capsule_event.dart';
part 'capsule_state.dart';

class CapsuleBloc extends Bloc<CapsuleEvent, CapsuleState> {
  final CapsuleRepository repo;

  CapsuleBloc(this.repo) : super(CapsuleState.initial()) {
    on<GetAll>((event, emit) async {
      emit(state.copyWith(status: CapsuleStatus.loading));
      var list = await repo.getAll();
      log("list $list");
      emit(state.copyWith(status: CapsuleStatus.loaded, capsules: list));
    });
  }
}
