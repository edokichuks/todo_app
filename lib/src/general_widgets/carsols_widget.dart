// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/utils/colors.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

// Package imports:

// ignore: must_be_immutable
class Carousel extends StatefulWidget {
  final List<File> imageList;
  // final bool isURL;
  List? url;
  Carousel({super.key, required this.imageList, required this.url});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  List allImages = [];

  final List _isSelected = [true, false, false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    allImages = [
      ...(widget.imageList),
      ...(widget.url ?? []),
    ];
  }

  @override
  void didUpdateWidget(Carousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    allImages = [
      ...(widget.imageList),
      ...(widget.url ?? []),
    ];
  }

  List<Widget> generateImageTiles() {
    // return (widget.url ?? widget.imageList)
    return (allImages).map(
      (element) {
        // debugPrint('ELEMENTS => $element');
        return ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: AppImageView(
                file: element is File ? element : null,
                url: (widget.url != null)
                    ? element.toString().startsWith('http')
                        ? element as String
                        : null
                    : null,
                width: double.infinity,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(15.r),
              )),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final imageSliders = generateImageTiles();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(3.w, 3.h),
                blurRadius: 4.r,
                spreadRadius: 4.r / 2.r,
                color: const Color.fromRGBO(23, 23, 23, 0.16),
              )
            ],
            border: Border.all(
              color: AppColors.frodorOffOrange,
            ),
          ),
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                aspectRatio: 18 / 10,
                autoPlay: ((allImages).length == 1) ? false : true,
                height: 200.h,
                enlargeCenterPage: true,
                animateToClosest: true,
                enlargeFactor: 1,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                onPageChanged: (index, reason) {
                  setState(() {
                    for (int i = 0; i < imageSliders.length; i++) {
                      if (i == index) {
                        _isSelected[i] = true;
                      } else {
                        _isSelected[i] = false;
                      }
                    }
                  });
                }),
            carouselController: _controller,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 80.w,
          child: ((allImages).length == 1)
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < allImages.length; i++)
                      GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(i);
                        },
                        child: Container(
                          height: 8.h,
                          width: 8.h,
                          decoration: BoxDecoration(
                            color: _isSelected[i]
                                ? AppColors.frodorGreen
                                : AppColors.frodorlightGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}
