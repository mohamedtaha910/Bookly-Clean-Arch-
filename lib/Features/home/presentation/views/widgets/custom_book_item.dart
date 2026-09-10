import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl}) ;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          // progressIndicatorBuilder: (context, url, downloadProgress) =>
          //     CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
