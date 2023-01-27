import 'package:flutter/material.dart';
import 'package:movies_go/models/movie_details_model.dart';

class MovieDetailContentProductionCompanies extends StatelessWidget {
  const MovieDetailContentProductionCompanies({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetailsModel? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          text: 'Companhia(s) produtora(s): ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: movie?.productionCompanies.join(', ') ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
