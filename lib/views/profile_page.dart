import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:anilandia/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String imageUrl =
    "https://a-static.besthdwallpaper.com/cute-anime-girl-with-her-gun-wallpaper-3840x2400-105722_9.jpg";

PanelController _pc = PanelController();
PanelController _pc1 = PanelController();
PanelController _pc2 = PanelController();

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () => {
                _pc.animatePanelToPosition(0.5),
                _pc1.animatePanelToPosition(0.5),
                _pc2.animatePanelToPosition(0.5)
              },
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 175),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
              ),
            ),
            child: const SingleChildScrollView(
              child: Text(
                "",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: 210,
            maxHeight: 750,
            color: utils.dark_1,
            controller: _pc,
            isDraggable: false,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            panel: InkWell(
              onTap: () => {_pc.open(), _pc1.close(), _pc2.close()},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppLocalizations.of(context)!.watching,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: 140,
            maxHeight: 680,
            color: utils.dark_2,
            controller: _pc1,
            isDraggable: false,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            panel: InkWell(
              onTap: () => {_pc.open(), _pc1.open(), _pc2.close()},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppLocalizations.of(context)!.will_watch,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: 70,
            maxHeight: 610,
            isDraggable: false,
            color: utils.dark_3,
            controller: _pc2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            panel: InkWell(
              onTap: () => {_pc.open(), _pc1.open(), _pc2.open()},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppLocalizations.of(context)!.watched,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
