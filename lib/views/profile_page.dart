import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:anilandia/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// Padding(
//   padding: const EdgeInsets.all(10),
//   child: Text(AppLocalizations.of(context)!.title),
// ),
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
              child: Image.network(
                "https://a-static.besthdwallpaper.com/cute-anime-girl-with-her-gun-wallpaper-3840x2400-105722_9.jpg",
                fit: BoxFit.fitWidth,
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 175),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
            ),
            child: const SingleChildScrollView(
              child: Text("aaa"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 475),
            decoration: const BoxDecoration(
              color: utils.dark_1,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: const SingleChildScrollView(
              child: Text("aaa"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 575),
            decoration: const BoxDecoration(
              color: utils.dark_2,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: const SingleChildScrollView(
              child: Text("Name2"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 675),
            decoration: const BoxDecoration(
              color: utils.dark_3,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: const SingleChildScrollView(
              child: Text("Name1"),
            ),
          ),
        ],
      ),
    );
  }
}

