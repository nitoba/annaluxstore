import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    Key key,
    @required this.productImage,
  }) : super(key: key);

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: productImage,
          fit: BoxFit.cover,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
