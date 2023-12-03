import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton(
      {super.key,
      this.color,
      this.child,
      this.width,
      this.height,
      required this.onTap,
      required this.icon,
      required this.text});

  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;
  final Function onTap;
  final Icon icon;
  final Text text;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool scale = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale ? 0.9 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: InkWell(
        onTap: () => widget.onTap(),
        onTapDown: (details) => setState(() {
          scale = true;
        }),
        onTapUp: (details) => setState(() {
          scale = false;
        }),
        onTapCancel: () => setState(() {
          scale = false;
        }),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 16,
                    spreadRadius: -4,
                    color: Color(0x40000000),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: widget.child,
            ),
            Column(
              children: [
                widget.icon,
                const SizedBox(
                  height: 5,
                ),
                widget.text,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
