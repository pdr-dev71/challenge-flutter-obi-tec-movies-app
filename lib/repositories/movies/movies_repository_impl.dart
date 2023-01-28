import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/api/rest_client.dart';
import 'package:movies_go/models/movie_details_model.dart';
import 'package:movies_go/models/movie_model.dart';
import 'package:movies_go/models/movie_video_model.dart';

import '../../core/ui/messages/messages.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;
  final message = Rxn<MessageModel>();

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: <String, String>{
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>(
                (date) => MovieModel.fromMap(date),
              )
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: <String, String>{
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>(
                (date) => MovieModel.fromMap(date),
              )
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      print('Erro ao buscar top_rated movies ${result.statusText}');
      throw Exception('Erro ao buscar filmes tops');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailsModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailsModel?>(
      '/movie/$id',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetailsModel.fromMap(data);
      },
    );
    if (result.hasError) {
      print('Erro ao buscar detalhes dos movies ${result.statusText}');
      throw Exception('Erro ao buscar detalhes dos filmes');
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');
      if (movie.favorite) {
        favoriteCollection.add(
          movie.toMap(),
        );

        Get.snackbar(
          'Adicionado',
          'Favorito adicionado com sucesso',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        favoriteData.docs.first.reference.delete();

        Get.snackbar(
          'Removido',
          'Favorito removido com sucesso',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritiesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();
    final listFavorities = <MovieModel>[];
    for (var movie in favoritiesMovies.docs) {
      listFavorities.add(
        MovieModel.fromMap(
          movie.data(),
        ),
      );
    }
    return listFavorities;
  }

  @override
  Future<List<MovieVideoModel>> findVideos(id) async {
    final result = await _restClient.get<List<MovieVideoModel>>(
      '/movie/$id/videos',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieVideoModel>(
                (date) => MovieVideoModel.fromMap(date),
              )
              .toList();
        }
        return <MovieVideoModel>[];
      },
    );
    if (result.hasError) {
      print('Erro ao buscar trailers ${result.statusText}');
      throw Exception('Erro ao buscar trailer do filme');
    }
    return result.body ?? <MovieVideoModel>[];
  }
}
