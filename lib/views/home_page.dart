import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = "https://i.ytimg.com/vi/YO88SHRHuwc/maxresdefault.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("AniLandia.tv"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  imageUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
