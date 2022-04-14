import 'package:chopper/chopper.dart';
import 'package:exercise/data/api/api_service.dart';
import 'package:exercise/data/api/remote_data_source.dart';
import 'package:exercise/data/repositories/movie_repo_impl.dart';
import 'package:exercise/domain/usecases/get_movielist_usecase.dart';
import 'package:exercise/presentation/home/home_bloc/get_movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final client = ChopperClient();
  //bloc
  sl.registerFactory<GetMovieBloc>(() => GetMovieBloc(useCase: sl.call()));

  //use
  sl.registerLazySingleton<GetMovieListUseCase>(
      () => GetMovieListUseCase(movieRepoImpl: sl.call()));

  //repo

  sl.registerLazySingleton<MovieRepoImplmentation>(
      () => MovieRepoImplmentation(remoteDataSource: sl.call()));

  //remote api

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSource(apiService: sl.call()));

  //chopper service

  sl.registerLazySingleton<ApiService>(() => ApiService.create(client));
}
