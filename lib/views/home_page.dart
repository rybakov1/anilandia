import 'package:anilandia/models/Anime.dart';
import 'package:anilandia/views/profile_page.dart';
import 'package:anilandia/widgets/custom_buttons.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = "https://i.ytimg.com/vi/YO88SHRHuwc/maxresdefault.jpg";
  List<Anime> animeExampleList = [
    Anime("Магическая битва", "аниме",
        "https://animego.org/upload/anime/images/5f7c1bb915a07033689374.jpg"),
    Anime("Восхождение в тени! 2", "манга",
        "https://animego.org/upload/anime/images/6501c1ba0e5fe561468799.jpg"),
    Anime("Доктор Стоун: Новый мир. Часть 2", "аниме",
        "https://animego.org/upload/anime/images/65280e06a81b0930473385.jpg"),
  ];

  void goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "AniLandia.tv",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            child: GestureDetector(
              onTap: goToProfilePage,
              child: AnimeImage(
                imageUrl: imageUrl,
                width: 40,
                height: 40,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          )
        ],
      ),
      body: ContinueWatching(
        anime: animeExampleList,
      ),
    );
  }
}

class ContinueWatching extends StatefulWidget {
  const ContinueWatching({super.key, required this.anime});

  final List<Anime> anime;

  @override
  State<ContinueWatching> createState() => _ContinueWatchingState();
}

class _ContinueWatchingState extends State<ContinueWatching> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: Text(
              AppLocalizations.of(context)!.continue_watching,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.anime.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 256,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF777777),
                        blurRadius: 16,
                        spreadRadius: -4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      AnimeImage(
                        imageUrl: widget.anime[index].imageUrl,
                        width: MediaQuery.of(context).size.width,
                        height: 196,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 16),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.anime[index].animeTitle,
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.anime[index].type,
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF444444)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: AnimeButton(
                                onPressed: () {},
                                type: widget.anime[index].type,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFF777777),
                          blurRadius: 16,
                          spreadRadius: -4,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      AnimeImage(
                          borderRadius: BorderRadius.circular(12),
                          imageUrl: widget.anime[index].imageUrl,
                          height: 64,
                          width: 64),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.anime[index].animeTitle,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.anime[index].type,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF444444)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: AnimeButton(
                            onPressed: () {},
                            type: widget.anime[index].type,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 8,
            ),
          )
        ],
      ),
    );
  }
}
