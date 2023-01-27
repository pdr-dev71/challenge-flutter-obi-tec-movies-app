import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/theme_extensions.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/router/router_navigation.dart';

class MovieDetailContentTitle extends StatelessWidget {
  const MovieDetailContentTitle({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetailsModel? movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            movie?.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingStars(
                value: (movie?.stars ?? 1) / 2,
                valueLabelVisibility: false,
                starColor: context.themeOrange,
                starSize: 14,
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    AppRouter.movieVideo,
                    arguments: movie,
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF2C3759)),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                    ),
                    Text(
                      'Ver trailer',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            movie?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(
              fontSize: 11,
              color: context.themeGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
