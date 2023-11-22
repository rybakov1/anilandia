import 'package:anilandia/utils.dart';
import 'package:anilandia/views/profile_page.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  String image =
      'https://animego.org/upload/anime/images/5f7c1bb915a07033689374.jpg';

  Padding commentSection() {
    return const Padding(
      padding: EdgeInsets.only(top: 32.0, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Комментарии ",
                style: TextStyle(fontSize: 16),
              ),
              Text("(192)", style: TextStyle(fontSize: 10)),
              Spacer(),
              Text(
                "написать комментарий",
                style: TextStyle(color: Color(0xFF4499EE)),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Container act() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Utils.playerDark,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            foregroundColor: Colors.white,
            expandedHeight: 550,
            flexibleSpace: FlexibleSpaceBar(
              background: AnimeImage(
                url:
                    'https://animego.org/upload/anime/images/5f7c1bb915a07033689374.jpg',
                borderRadius: BorderRadius.zero,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
              ),
              ColoredBox2(
                  height: 364,
                  colorBack: Colors.white,
                  color: Utils.playerDark,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Смотреть аниме",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.network(
                        image,
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                            act(),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const ColoredBox2(
                height: 500,
                colorBack: Utils.playerDark,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Комментарии ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text("(192)", style: TextStyle(fontSize: 10)),
                          Spacer(),
                          Text(
                            "написать комментарий",
                            style: TextStyle(
                                color: Color(0xFF4499EE), fontSize: 10),
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
              const ColoredBox2(
                height: 56,
                colorBack: Colors.white,
                color: Utils.playerDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AniLandia 2023-2024 | Все права защищены",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColoredBox2 extends StatelessWidget {
  const ColoredBox2(
      {super.key,
      required this.height,
      required this.colorBack,
      required this.color,
      required this.child});

  final double height;
  final Color colorBack;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: colorBack,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: child,
      ),
    );
  }
}
