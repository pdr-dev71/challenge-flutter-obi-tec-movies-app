import 'package:get/get.dart';
import 'package:movies_go/modules/movie_details/movie_detals_controller.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MovieDetailController(
        moviesService: Get.find(),
      ),
    );
  }
}
