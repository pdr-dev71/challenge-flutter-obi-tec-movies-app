import 'package:flutter/material.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/modules/movie_details/widgets/movie_detail_content/movie_detail_credits.dart';
import 'package:movies_go/modules/movie_details/widgets/movie_detail_content/movie_detail_main_cast.dart';
import 'package:movies_go/modules/movie_details/widgets/movie_detail_content/movie_detail_product_companies.dart';
import 'package:movies_go/modules/movie_details/widgets/movie_detail_content/movie_detail_title.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie),
        MovieDetailContentMainCast(movie: movie),
      ],
    );
  }
}
