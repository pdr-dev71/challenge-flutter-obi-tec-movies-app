import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_go/modules/auth/signin/signin_bindings.dart';
import 'package:movies_go/modules/auth/signin/signin_page.dart';
import 'package:movies_go/modules/auth/signup/signup_page.dart';
import 'package:movies_go/modules/favorites/favorites_bindings.dart';
import 'package:movies_go/modules/favorites/favorites_page.dart';
import 'package:movies_go/modules/home/home_bindings.dart';
import 'package:movies_go/modules/home/home_page.dart';
import 'package:movies_go/modules/movie_details/movie_details_bindings.dart';
import 'package:movies_go/modules/movie_details/movies_details_page.dart';
import 'package:movies_go/modules/movie_video/movie_video_bindings.dart';
import 'package:movies_go/modules/movie_video/video_page.dart';
import 'package:movies_go/modules/pre_auth/google_signin_bindings.dart';
import 'package:movies_go/modules/pre_auth/pre_auth_page.dart';
import 'package:movies_go/modules/profile/profile.dart';
import 'package:movies_go/modules/splash/splash_bindings.dart';
import 'package:movies_go/modules/splash/splash_page.dart';

class AppRouter {
  static String splash = '/splash';
  static String preAuth = '/preAuth';
  static String sigup = '/sigup';
  static String movieVideo = '/movieVideo';
  static String signin = '/signin';
  static String profile = '/profile';
  static String movieDetail = '/movieDetail';
  static String home = '/';
  static String favorites = '/favorites';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: preAuth,
      page: () => const PreAuthPage(),
      binding: GoogleSigninBindings(),
    ),
    GetPage(
      name: movieVideo,
      page: () => const MovieVideoPage(),
      binding: MovieVideoBindings(),
    ),
    GetPage(
      name: sigup,
      page: () => SignupPage(),
    ),
    GetPage(
      name: favorites,
      page: () => const FavoritesPage(),
      binding: FavoritesBindings(),
    ),
    GetPage(
      name: signin,
      page: (() => const SigninPage()),
      binding: SigninBindings(),
    ),
    GetPage(
      name: movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: profile,
      page: () => const Profile(),
    ),
  ];
}
