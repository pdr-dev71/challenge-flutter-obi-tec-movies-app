import 'package:flutter/material.dart';
import 'package:movies_go/models/movie_details_model.dart';

class MovieDetailContentCredits extends StatelessWidget {
  const MovieDetailContentCredits({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movie?.overview ?? '',
          style: const TextStyle(
            fontSize: 14,
            height: 1.3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
