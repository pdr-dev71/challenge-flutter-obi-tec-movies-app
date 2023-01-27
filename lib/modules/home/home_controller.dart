import 'package:get/get.dart';
import 'package:movies_go/router/router_navigation.dart';
import 'package:movies_go/services/signin_google/google_signin_service.dart';

class HomeController extends GetxController {
  // ignore: constant_identifier_names
  static const NAVIGATOR_KEY = 1;
  // ignore: constant_identifier_names
  static const INDEX_PAGE_EXIT = 2;

  final GoogleSigninService _googleSigninService;
  HomeController({
    required GoogleSigninService googleSigninService,
  }) : _googleSigninService = googleSigninService;

  final _pages = [
    '/movies',
    '/favorites',
    '/profile',
  ];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _googleSigninService.logout();
      Get.offAllNamed(AppRouter.signin);
    } else {
      Get.offNamed(
        _pages[page],
        id: NAVIGATOR_KEY,
      );
    }
  }
}
