// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// Project imports:
import 'package:todo_app/src/features/photos/model/photo_model/photo_model.dart';
import 'package:todo_app/src/features/photos/widgets/image_card.dart';

class AnimiateGridview extends StatelessWidget {
  const AnimiateGridview({super.key, required this.photoList});
  final List<PhotoModel> photoList;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return AnimationLimiter(
      child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: columnCount,
          children: [
            ...List.generate(
              photoList.length,
              (int index) {
                final singlePhoto = photoList[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: w / 30, left: w / 60, right: w / 60),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ImageCard(
                          imageURL: singlePhoto.thumbnailUrl ??
                              'data:image/jpeg;base64,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',
                          title: singlePhoto.title ?? 'title',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
      // ),
    );
  }
}
