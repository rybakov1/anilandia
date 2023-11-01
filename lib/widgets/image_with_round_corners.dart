import 'package:flutter/material.dart';

class AnimeImage extends StatelessWidget {
  const AnimeImage(
      {super.key,
      required this.imageUrl,
      required this.borderRadius,
      required this.height,
      required this.width});

  final String imageUrl;
  final BorderRadius borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
