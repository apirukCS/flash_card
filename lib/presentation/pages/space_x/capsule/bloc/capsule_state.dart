part of 'capsule_bloc.dart';

class CapsuleState extends Equatable {
  final CapsuleStatus? status;
  final List<CapsuleModel> capsules;
  const CapsuleState({required this.capsules, this.status});

  const CapsuleState.initial()
    : capsules = const [],
      status = CapsuleStatus.initial;

  CapsuleState copyWith({List<CapsuleModel>? capsules, CapsuleStatus? status}) {
    return CapsuleState(
      capsules: capsules ?? this.capsules,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [capsules, status];
}

enum CapsuleStatus { initial, loading, loaded, error, success }
