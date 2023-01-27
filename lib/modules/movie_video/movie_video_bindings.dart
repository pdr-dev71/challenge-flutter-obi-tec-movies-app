import 'package:get/get.dart';

import 'movie_video_controller.dart';

class MovieVideoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieVideoController());
  }
}
