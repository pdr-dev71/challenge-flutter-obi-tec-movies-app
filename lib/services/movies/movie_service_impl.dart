import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/models/movie_video_model.dart';
import 'package:movies_go/repositories/movies/movies_repository.dart';
import 'package:movies_go/services/movies/movie_service.dart';

class MoviesServiceImpl implements MoviesService {
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  final MoviesRepository _moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieVideoModel>> findVideos(id) =>
      _moviesRepository.findVideos(id);

  @override
  Future<List<MovieModel>> getTopRatedMovies() =>
      _moviesRepository.getTopRatedMovies();

  @override
  Future<MovieDetailsModel?> getDetail(int id) =>
      _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavorite(
        userId,
        movie,
      );

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) =>
      _moviesRepository.getFavoritiesMovies(userId);
}
