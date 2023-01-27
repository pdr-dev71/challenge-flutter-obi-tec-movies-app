import 'package:movies_go/models/genres_model.dart';
import 'package:movies_go/repositories/genres/genres_repository.dart';
import 'package:movies_go/services/genres/genres_services.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genreRepository;

  GenresServiceImpl({
    required GenresRepository genreRepository,
  }) : _genreRepository = genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
