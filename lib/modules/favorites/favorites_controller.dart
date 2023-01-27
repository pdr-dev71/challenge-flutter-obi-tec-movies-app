import 'package:get/get.dart';
import 'package:movies_go/core/auth/auth_service.dart';
import 'package:movies_go/core/ui/loader/loader.dart';
import 'package:movies_go/core/ui/messages/messages.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/services/movies/movie_service.dart';

class FavoritesController extends GetxController
    with LoaderMixin, MessagesMixin {
  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  final MoviesService _moviesService;
  final AuthService _authService;
  var movies = <MovieModel>[].obs;
  final message = Rxn<MessageModel>();

  @override
  Future<void> onReady() async {
    super.onReady();
    _getFavorities();
  }

  Future<void> _getFavorities() async {
    var user = _authService.user;
    if (user != null) {
      var favorities = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorities);
    }
  }

  Future<void> removeFavorite({required MovieModel movie}) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
        user.uid,
        movie.copyWith(favorite: false),
      );
      movies.remove(movie);
    }
  }
}
