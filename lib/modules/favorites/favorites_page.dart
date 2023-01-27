import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/widgets/custom_app_bar.dart';
import 'package:movies_go/core/ui/widgets/movie_card.dart';

import 'favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Favoritos'),
      ),
      body: Obx(() {
        if (controller.movies.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não há nada por aqui',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/favorites_void.png',
                  height: 250,
                  width: 300,
                )
              ],
            ),
          );
        }
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (m) => MovieCard(
                      movie: m,
                      favoriteCallback: () =>
                          controller.removeFavorite(movie: m),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
