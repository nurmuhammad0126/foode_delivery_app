import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

class WCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const WCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          (context, url) => Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              color: Colors.white,
            ),
          ),
      errorWidget: (context, url, error) {
        print("Image Error: $error");
        return Icon(Icons.error);
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(10.o),
        child: image,
      );
    } else {
      return image;
    }
  }
}