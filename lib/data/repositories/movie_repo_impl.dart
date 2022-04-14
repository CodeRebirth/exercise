import 'package:dartz/dartz.dart';
import 'package:exercise/data/api/remote_data_source.dart';
import 'package:exercise/data/models/custom_error.dart';
import 'package:exercise/domain/repositories/movie_repo.dart';
import '../models/movie.dart';

class MovieRepoImplmentation implements MovieRepo {
  final RemoteDataSource remoteDataSource;
  MovieRepoImplmentation({required this.remoteDataSource});

  @override
  Future<Either<CustomError, List<Movie>>> getMovieList(
      int limit, int offset) async {
    final List<Movie> movieList = [];
    final data = await remoteDataSource.getMovieList(limit, offset);

    if (data != null) {
      data.forEach((e) {
        movieList.add(Movie.fromJson(e));
      });

      return Right(movieList);
    } else {
      return Left(CustomError("Something went wrong"));
    }
  }
}
