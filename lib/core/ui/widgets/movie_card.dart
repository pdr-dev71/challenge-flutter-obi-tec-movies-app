import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movies_go/core/ui/movie_app_icons.dart';
import 'package:movies_go/core/ui/theme_extensions.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/router/router_navigation.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    Key? key,
    required this.movie,
    required this.favoriteCallback,
  }) : super(key: key);

  final MovieModel movie;
  final dateFormat = DateFormat('dd/MM/y');
  final VoidCallback favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRouter.movieDetail,
          arguments: movie.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 305,
        width: 170,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                      height: 190,
                      width: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 5),
                Text(
                  dateFormat.format(DateTime.parse(movie.releaseDate)),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 65,
              right: -4,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color:
                      movie.favorite ? Colors.white : const Color(0xFF5FCFED),
                  height: 40,
                  child: IconButton(
                    iconSize: 18,
                    icon: Icon(
                      movie.favorite
                          ? FilmesAppIcons.heart
                          : FilmesAppIcons.heartEmpty,
                      color: movie.favorite ? context.themeRed : Colors.white,
                    ),
                    onPressed: favoriteCallback,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
