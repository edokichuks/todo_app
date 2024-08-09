// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkDisplay extends StatelessWidget {
  const CachedNetworkDisplay({
    super.key,
    required this.imageUrl,
    this.boxFit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadiusGeometry,
  });
  final String imageUrl;
  final BoxFit boxFit;
  final double? height, width;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadiusGeometry ?? BorderRadius.circular(10),
      child: switch (imageUrl.isEmpty) {
        true => Container(
            height: height,
            width: width,
            color: Colors.grey.shade300,
          ),
        _ => CachedNetworkImage(
            memCacheHeight: height?.round(),
            memCacheWidth: width?.round(),
            progressIndicatorBuilder: (context, url, progress) {
              return AnimatedOpacity(
                opacity: 0.1,
                duration: const Duration(milliseconds: 300),
                child: Image.asset('assets/images/icon.png'),
              );
            },
            errorWidget: (context, url, error) {
              return AnimatedOpacity(
                opacity: 0.1,
                duration: const Duration(milliseconds: 300),
                child: Image.asset('assets/images/icon.png'),
              );
            },
            height: height,
            width: width,
            fit: boxFit,
            imageUrl: imageUrl,
          ),
      },
    );
  }
}
