// presentation/injection.dart
import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/repositories/space_x/capsule_repository_impl.dart';
import 'package:flash_card/data/repositories/vocabulary_repository_impl.dart';
import 'package:flash_card/domain/repositories/space_x/capsule_repository.dart';
import 'package:flash_card/domain/repositories/vocabulary_repository.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/pages/space_x/capsule/bloc/capsule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDependencyInjector extends StatelessWidget {
  final Widget child;

  const AppDependencyInjector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CapsuleRepository>(
          create: (_) => CapsuleRepositoryImpl(),
        ),

        RepositoryProvider<VocabularyRepository>(
          create: (_) => VocabularyRepositoryImpl(DatabaseHelper()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CapsuleBloc>(
            create: (context) => CapsuleBloc(context.read<CapsuleRepository>()),
          ),

          BlocProvider<VocabularyBloc>(
            create: (context) => VocabularyBloc(context.read<VocabularyRepository>()),
          ),
        ],
        child: child,
      ),
    );
  }
}
