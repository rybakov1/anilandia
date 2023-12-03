import 'package:anilandia/models/anime_model.dart';
import 'package:anilandia/services/shikimori_api.dart';
import 'package:anilandia/views/anime_page.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  late Future<List<AnimeSearchModel>> animeList;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> params = {'limit': '20', 'order': 'ranked'};
    animeList = AnimeApi().getAnimeList(params);
  }

  void navigateToAnimePage(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimePage(id: id),
      ),
    );
  }

  Stack scorePlate(String score) {
    if (double.parse(score) > 0) {
      return Stack(
        children: [
          Container(
            width: 55,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                ),
                const SizedBox(width: 2),
                Text(
                  score,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return const Stack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xFFC94949),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          "AniLandia.tv",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF444444),
              ),
              child: searchWidget(controller),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: animeList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      dynamic object = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 16.0, right: 16.0),
                        child: InkWell(
                          onTap: () => {navigateToAnimePage(object.id!)},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  AnimeImage(
                                    url: object.image,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  scorePlate(object.score)
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${object.id} | ${object.name!}",
                                        style: const TextStyle(
                                          fontFamily: "Inter",
                                          color: Colors.grey,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Text(object.russian!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFC94949),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    Text(
                                      "${object.kindRussian!} | ${object.releaseYear}",
                                      style:
                                          const TextStyle(fontFamily: "Inter"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text(snapshot.error.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextField searchWidget(controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xFFEEEEEE),
        decoration: TextDecoration.none,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 16, top: 10, right: 0),
        border: InputBorder.none,
        suffixIcon: Icon(Icons.search_rounded, color: Colors.white),
        hintText: "Аниме, манга, ранобе и многое другое...",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF999999),
            decoration: TextDecoration.none),
      ),
      onSubmitted: (value) {
        final params = {
          'search': value,
          'kind': '!music',
          'limit': '50',
          'order': 'id'
        };
        setState(
          () {
            animeList = AnimeApi().getAnimeList(params);
          },
        );
      },
    );
  }
}
