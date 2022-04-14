import 'package:dartz/dartz.dart';
import 'package:exercise/data/models/custom_error.dart';
import 'package:exercise/data/models/movie.dart';
import 'package:exercise/data/repositories/movie_repo_impl.dart';

class GetMovieListUseCase {
  final MovieRepoImplmentation movieRepoImpl;
  GetMovieListUseCase({required this.movieRepoImpl});
  Future<Either<CustomError, List<Movie>>> getMovieList(int limit, int offset) {
    return movieRepoImpl.getMovieList(limit, offset);
  }
}
