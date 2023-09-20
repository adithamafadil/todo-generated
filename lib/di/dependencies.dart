import 'package:flutter_generated/data/datasources/todo/todo_remote_datasource.dart';
import 'package:flutter_generated/data/mapper/todo/todo_mapper.dart';
import 'package:flutter_generated/data/repositories/todo/todo_repository_impl.dart';
import 'package:flutter_generated/domain/repositories/todo/todo_repository.dart';
import 'package:flutter_generated/domain/usecases/todo/get_todos_usecase.dart';
import 'package:flutter_generated/presentation/blocs/todo/todo_cubit.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

class Dependencies {
  Dependencies() {
    configure();
  }

  void configure() async {
    registerBlocs();
    registerMappers();
    registerUsecases();
    registerRepositories();
    registerDatasources();
  }

  void registerBlocs() {
    inject.registerFactory<TodoCubit>(
        () => TodoCubit(getTodosUsecase: inject<GetTodosUsecase>()));
  }

  void registerMappers() {
    inject.registerLazySingleton<TodoMapper>(() => TodoMapper());
  }

  void registerUsecases() {
    inject.registerLazySingleton<GetTodosUsecase>(
        () => GetTodosUsecase(inject<TodoRepository>()));
  }

  void registerRepositories() {
    inject.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(
          mapper: inject<TodoMapper>(),
          remoteDatasource: inject<TodoRemoteDatasource>(),
        ));
  }

  void registerDatasources() {
    inject.registerLazySingleton<TodoRemoteDatasource>(
        () => TodoRemoteDatasource());
  }
}
