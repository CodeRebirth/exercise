import 'package:exercise/domain/entities/movie_entity.dart';
import 'package:exercise/domain/usecases/get_movielist_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie.dart';

abstract class GetMoviesBlocEvent {}

abstract class GetMoviesBlocState {}

class InitialState extends GetMoviesBlocState {}

class GetMovieList extends GetMoviesBlocEvent {
  final int limit;
  final int offset;
  GetMovieList(this.limit, this.offset);
}

class MovieFetch extends GetMoviesBlocState {
  final List<Movie> movieList;
  MovieFetch(this.movieList);
}

class LazyLoad extends GetMoviesBlocEvent {
  final int limit;
  final int offset;
  LazyLoad(this.limit, this.offset);
}

class LazyLoadWaiting extends GetMoviesBlocState {}

class GetMovieFailure extends GetMoviesBlocState {}

class Waiting extends GetMoviesBlocState {}

class GetMovieBloc extends Bloc<GetMoviesBlocEvent, GetMoviesBlocState> {
  GetMovieListUseCase useCase;
  List<Movie> movieList = [];

  GetMovieBloc({required this.useCase}) : super(InitialState()) {
    on<GetMovieList>((event, emit) async {
      emit(Waiting());
      try {
        final data = await useCase.getMovieList(event.limit, event.offset);
        data.fold((l) {
          emit(GetMovieFailure());
        }, (r) {
          movieList.addAll(r);

          emit(MovieFetch(movieList));
        });
      } catch (e) {
        emit(GetMovieFailure());
      }
    });
    on<LazyLoad>(((event, emit) async {
      try {
        final data = await useCase.getMovieList(event.limit, event.offset);
        data.fold((l) {
          emit(GetMovieFailure());
        }, (r) {
          movieList.addAll(r);

          emit(MovieFetch(movieList));
        });
      } catch (e) {
        emit(GetMovieFailure());
      }
    }));
  }
}
