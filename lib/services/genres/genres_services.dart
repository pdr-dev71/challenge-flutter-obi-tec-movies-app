import 'package:movies_go/models/genres_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
