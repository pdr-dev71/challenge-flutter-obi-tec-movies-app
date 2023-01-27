import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/movie_app_icons.dart';
import 'package:movies_go/modules/favorites/favorites_bindings.dart';
import 'package:movies_go/modules/favorites/favorites_page.dart';
import 'package:movies_go/modules/movies/movies_bindigs.dart';
import 'package:movies_go/modules/movies/movies_page.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: const Color(0xFF5FCFED),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF2C3759),
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(FilmesAppIcons.heartEmpty),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
              binding: FavoritesBindings(),
            );
          }

          return null;
        },
      ),
    );
  }
}
