import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/modules/movies/movies_controller.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.width * .42,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/logo_header.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * .9,
            padding: const EdgeInsets.only(bottom: 40),
            child: TextField(
              onChanged: (value) => controller.filterByName(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar filmes',
                labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.0, -1),
                  end: const Alignment(0.0, 1),
                  colors: <Color>[
                    const Color(0xFF05133A).withOpacity(0),
                    const Color(0xFF05133A),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
