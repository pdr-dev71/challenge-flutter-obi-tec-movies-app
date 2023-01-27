import 'package:get/get.dart';
import 'package:movies_go/core/ui/messages/messages.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/services/movies/movie_service.dart';

import '../../core/ui/loader/loader.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  MovieDetailController({
    required MoviesService moviesService,
  }) : _moviesService = moviesService;

  final MoviesService _moviesService;
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      MessageModel.error(
        title: 'Erro',
        message: 'Erro ao buscar detalhe do filme',
      );
    }
  }
}
