import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/modules/movie_details/movie_detals_controller.dart';

class MovieDetailHeader extends GetView<MovieDetailController> {
  const MovieDetailHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
