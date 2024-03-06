//Create an instance of the GetIt service locator
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/task/data/data_sources/remote_data_sources/todo_remote_data_source_impl.dart';
import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart';
import 'package:todo/src/task/data/repositories/todo_repository_impl.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';
import 'package:todo/src/task/domain/usecases/create_todo.dart';
import 'package:todo/src/task/domain/usecases/get_all_todo.dart';
import 'package:todo/src/task/presentation/bloc/todo_bloc/todo_bloc.dart';

final getIt = GetIt.instance;

//init () is responsible for initializing and registering dependencies
void init() {
  //Bloc
  getIt.registerFactory(() => TodoBloc(createTodo: getIt()));
  //getIt.registerFactory(() => UpdateTodoBloc(updateTodo: getIt()));
  //getIt.registerFactory(() => DeleteTodoBloc(deleteTodo: getIt()));
  //getIt.registerFactory(() => GetTodoBloc(getTodo: getIt()));
  //Register the PopularMovieBloc as a factory in GetI
  //whenever someone requests an instance of PopularMovieBloc, GetIt will create a new instance

  //Use cases
  getIt.registerLazySingleton(() => CreateTodo(getIt<TodoRepository>(),
      Todo(id: '', date: '', status: '', priority: '', title: '')));
  getIt.registerLazySingleton(() => GetAllTodo(getIt<TodoRepository>()));
  //getIt.registerLazySingleton(() => SearchMovies(getIt()));
  //It ensures that only one instance of GetPopularMovies exists in the application
  //instance is created only when it is first requested

  //Repositories
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(remoteDataSource: getIt()));

  //Data sources
  getIt.registerLazySingleton<TodoRemoteDataSource>(
      () => FirebaseTodoRemoteDataSourceImpl(firestore: getIt()));

  //Http services
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}
