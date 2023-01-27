import 'package:movies_go/models/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenreModel>> getGenres();
}
