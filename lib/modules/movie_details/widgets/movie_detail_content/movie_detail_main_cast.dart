import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/theme_extensions.dart';
import 'package:movies_go/models/movie_details_model.dart';

import 'movie_cast.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  MovieDetailContentMainCast({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetailsModel? movie;
  final showPanel = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: context.themeGrey),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) => showPanel.toggle(),
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: showPanel.value,
                backgroundColor: const Color(0xFF2C3759),
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map(
                              (cast) => MovieCast(
                                cast: cast,
                              ),
                            )
                            .toList() ??
                        const [],
                  ),
                ),
              ),
            ],
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }
}
