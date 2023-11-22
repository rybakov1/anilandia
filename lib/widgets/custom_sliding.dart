import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingUpPanel extends StatefulWidget {
  const CustomSlidingUpPanel({
    super.key,
    required this.minHeight,
    required this.maxHeight,
    required this.color,
    required this.controller,
    required this.onTap,
    required this.header,
    required this.container,
  });

  final double minHeight;
  final double maxHeight;
  final Color color;
  final PanelController controller;
  final Function onTap;
  final PanelHeader header;
  final Container container;

  @override
  State<CustomSlidingUpPanel> createState() => _CustomSlidingUpPanelState();
}

class _CustomSlidingUpPanelState extends State<CustomSlidingUpPanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: widget.minHeight,
      maxHeight: widget.maxHeight,
      color: widget.color,
      controller: widget.controller,
      isDraggable: false,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      panel: InkWell(
        onTap: () => widget.onTap(),
        child: Column(
          children: [
            widget.header,
            widget.container,
          ],
        ),
      ),
    );
  }
}

class PanelHeader extends StatefulWidget {
  const PanelHeader(
      {super.key,
      required this.title,
      required this.color,
      required this.count});

  final String title;
  final Color color;
  final String count;

  @override
  State<PanelHeader> createState() => _PanelHeaderState();
}

class _PanelHeaderState extends State<PanelHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 8, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(widget.count,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                )
              ],
            ),
          ),
          Divider(color: widget.color)
        ],
      ),
    );
  }
}
