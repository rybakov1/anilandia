import 'package:flutter/material.dart';

class AnimeImage extends StatelessWidget {
  const AnimeImage(
      {super.key,
      required this.url,
      required this.borderRadius,
      required this.height,
      required this.width});

  final String url;
  final BorderRadius borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
