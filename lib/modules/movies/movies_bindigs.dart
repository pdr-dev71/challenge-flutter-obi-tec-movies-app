import 'package:get/get.dart';
import 'package:movies_go/modules/movies/movies_controller.dart';
import 'package:movies_go/repositories/genres/genres_repository.dart';
import 'package:movies_go/repositories/genres/genres_repository_impl.dart';
import 'package:movies_go/services/genres/genres_services.dart';
import 'package:movies_go/services/genres/genres_services_impl.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut<GenresService>(
      () => GenresServiceImpl(
        genreRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => MoviesController(
        genresService: Get.find(),
        moviesService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
