import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_go/modules/movie_video/movie_video_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideoPage extends GetView<MovieVideoController> {
  const MovieVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.orientation == Orientation.portrait
          ? AppBar(title: Text(controller.movie.title), elevation: 0)
          : null,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Obx(() => body(context)),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    if (controller.loading.value) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (controller.videos.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum trailer encontrado",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Platform.isWindows && context.orientation == Orientation.landscape)
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: Get.back,
          ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.videos.length,
            physics: context.orientation == Orientation.landscape &&
                    !Platform.isWindows
                ? const NeverScrollableScrollPhysics()
                : null,
            itemBuilder: (c, i) {
              return SizedBox(
                height: context.orientation == Orientation.landscape &&
                        !Platform.isWindows
                    ? context.height
                    : null,
                width: context.orientation == Orientation.landscape &&
                        !Platform.isWindows
                    ? context.width
                    : null,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                      const PlaybackSpeedButton(),
                      const SizedBox(width: 20),
                      RemainingDuration(),
                      IconButton(
                        onPressed: () async {
                          controller.videoControllers[i].toggleFullScreenMode();
                        },
                        icon: const Icon(Icons.fullscreen),
                      )
                    ],
                    topActions: [
                      Visibility(
                        visible: context.orientation == Orientation.landscape,
                        child: IconButton(
                          onPressed: () {
                            SystemChrome.setPreferredOrientations(
                                [DeviceOrientation.portraitUp]);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      )
                    ],
                    controller: controller.videoControllers[i],
                    showVideoProgressIndicator: true,
                  ),
                  builder: ((p0, p1) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: p1),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(controller.videos[i].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://www.youtube.com/watch?v=${controller.videos[i].key}"));
                                },
                                child: const Text(
                                  "Abrir no Youtube",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
