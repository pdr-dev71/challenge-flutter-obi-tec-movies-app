import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/models/movie_video_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieVideoModel>> findVideos(id);
  Future<MovieDetailsModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritiesMovies(String userId);
}
