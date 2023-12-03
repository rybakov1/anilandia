import 'dart:developer';

import 'package:anilandia/models/anime_full_model.dart';
import 'package:anilandia/services/shikimori_api.dart';
import 'package:anilandia/utils.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key, required this.id});

  final int id;

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  String image =
      'https://animego.org/upload/anime/images/5f7c1bb915a07033689374.jpg';
  late Future<AnimeFull> animeObject;

  @override
  void initState() {
    super.initState();
    animeObject = AnimeApi().getAnimeById(widget.id);
  }

  Container infoSection(child) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: child,
    );
  }

  ColoredBox2 player() {
    return ColoredBox2(
      height: 364,
      colorBack: Colors.white,
      color: Utils.playerDark,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 50,
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
          const ActionButtons(count: 5)
        ],
      ),
    );
  }

  ColoredBox2 commentSection() {
    return const ColoredBox2(
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
                  style: TextStyle(color: Color(0xFF4499EE), fontSize: 10),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  ColoredBox2 footer() {
    return const ColoredBox2(
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
    );
  }

  Column description(String key, String value) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                key,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: animeObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String genres = "";
            int genresIndex = snapshot.data!.genres!.length;
            for (int i = 0; i <= genresIndex - 1; i++) {
              if (i != genresIndex - 1) {
                genres += "${snapshot.data!.genres![i].russian!}, ";
              } else {
                genres += snapshot.data!.genres![i].russian!;
              }
            }

            String studios = "";
            int studiosIndex = snapshot.data!.studios!.length;
            if (studiosIndex != 0) {
              for (int i = 0; i <= studiosIndex - 1; i++) {
                studios += "${snapshot.data!.studios![i].name!} ";
              }
            } else {
              studios = "Неизвестно";
            }

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  foregroundColor: Colors.white,
                  expandedHeight: 550,
                  flexibleSpace: FlexibleSpaceBar(
                    background: AnimeImage(
                      url: snapshot.data!.image!,
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
                    infoSection(
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.russian!,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  wordSpacing: 2.5),
                            ),
                            Text(
                              snapshot.data!.name!,
                              style: const TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: "Inter",
                                wordSpacing: 2.5,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Описание",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                            const Divider(color: Color(0xFFE0E0E0)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  description(
                                      "Тип", snapshot.data!.kindRussian!),
                                  description("Эпизоды",
                                      snapshot.data!.episodes!.toString()),
                                  description(
                                      "Статус", snapshot.data!.statusRussian!),
                                  if (snapshot.data!.airedOn != null)
                                    description(
                                        "Сезон", snapshot.data!.airedOn!),
                                  if (snapshot.data!.studios != null)
                                    description("Студия", studios),
                                  // license_name_ru
                                  description("Жанр", genres),
                                  description("Длительность",
                                      "${snapshot.data!.duration} мин. ~ серия"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Главные герои",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ),
                            const Divider(color: Color(0xFFE0E0E0)),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      snapshot.data!.mainCharacters!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFF7F7F7),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: const [
                                                BoxShadow(
                                                    spreadRadius: -5,
                                                    blurRadius: 4,
                                                    color: Color(0xBF000000),
                                                    offset: Offset(0, 2))
                                              ]),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: AnimeImage(
                                                    width: 32,
                                                    height: 32,
                                                    url: snapshot
                                                        .data!
                                                        .mainCharacters![index]
                                                        .image!,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4,
                                                    top: 4,
                                                    bottom: 4,
                                                    right: 8),
                                                child: Text(snapshot
                                                    .data!
                                                    .mainCharacters![index]
                                                    .russian!),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    player(),
                    commentSection(),
                    footer()
                  ],
                ),
              ),
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
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
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: child,
      ),
    );
  }
}

class ActionButtons extends StatefulWidget {
  const ActionButtons({super.key, required this.count});

  final int count;

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  Row oneButton() {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                color: Utils.playerDark,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.count; i++) oneButton(),
        ],
      ),
    );
  }
}
