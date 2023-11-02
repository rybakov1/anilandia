import 'package:flutter/material.dart';

class AnimeButton extends StatelessWidget {
  const AnimeButton({super.key, required this.onPressed, required this.type});

  final GestureTapCallback onPressed;
  final String type;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      shape: const StadiumBorder(),
      enableFeedback: false,
      child: Container(
        margin: EdgeInsets.zero,
        height: 26,
        width: 96,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF777777),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            type == "аниме" ? "СМОТРЕТЬ" : "ЧИТАТЬ",
            style: const TextStyle(
                color: Color(0xFF3333FF),
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
