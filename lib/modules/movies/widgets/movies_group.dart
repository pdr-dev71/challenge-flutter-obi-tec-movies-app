import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/messages/messages.dart';
import 'package:movies_go/core/ui/widgets/movie_card.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/modules/movies/movies_controller.dart';

class MoviesGroup extends GetView<MoviesController> {
  MoviesGroup({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  final String title;
  final List<MovieModel> movies;
  final message = Rxn<MessageModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 280,
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var movie = movies[index];
                  return MovieCard(
                    movie: movie,
                    favoriteCallback: () => controller.favoriteMovie(movie),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
