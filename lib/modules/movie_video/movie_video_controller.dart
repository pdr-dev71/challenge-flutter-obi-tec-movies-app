import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/repositories/movies/movies_repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/movie_video_model.dart';

class MovieVideoController extends GetxController {
  final _repository = Get.find<MoviesRepository>();
  final movie = Get.arguments as MovieDetailsModel;
  final videos = <MovieVideoModel>[];
  final videoControllers = <YoutubePlayerController>[];
  final loading = false.obs;

  Future<void> findVideos() async {
    try {
      loading(true);
      final res = await _repository.findVideos(movie.id);
      videos.assignAll(res);
      closeAllYoutubeControllers();
      videoControllers.assignAll(
        videos.map((e) => YoutubePlayerController(
              initialVideoId: e.key,
              flags: const YoutubePlayerFlags(autoPlay: false),
            )),
      );
    } finally {
      loading(false);
    }
  }

  void closeAllYoutubeControllers() {
    for (var e in videoControllers) {
      e.dispose();
    }
    videoControllers.clear();
  }

  @override
  void onInit() {
    findVideos();
    super.onInit();
  }

  @override
  void onClose() {
    if (Get.context!.orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    closeAllYoutubeControllers();
    super.onClose();
  }
}
