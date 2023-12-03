import 'dart:developer';
import 'dart:ui';

import 'package:anilandia/models/Anime.dart';
import 'package:anilandia/views/anime_page.dart';
import 'package:anilandia/views/profile_page.dart';
import 'package:anilandia/views/search_page.dart';
import 'package:anilandia/views/settings_page.dart';
import 'package:anilandia/widgets/custom_buttons.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:anilandia/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      "https://sportishka.com/uploads/posts/2022-11/1667491843_58-sportishka-com-p-furiya-mashina-vkontakte-66.jpg";
  List<Anime> animeExampleList = [
    Anime("Магическая битва", "аниме",
        "https://sportishka.com/uploads/posts/2022-11/1667491843_58-sportishka-com-p-furiya-mashina-vkontakte-66.jpg"),
  ];

  void navigateToAnimePage(id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimePage(id: id,),
      ),
    );
  }

  void navigateToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  void navigateToSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  void navigateToSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC94949),
        title: const Text(
          "AniLandia.tv",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFCFCFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: NavigationButton(
                      onTap: () => navigateToAnimePage(123),
                      height: 316,
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 96,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(blurRadius: 8, color: Color(0xBF000000))
                        ],
                      ),
                      text: const Text(
                        "Продолжить\n просмотр",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Image.network(
                            "https://sportishka.com/uploads/posts/2022-11/1667491843_58-sportishka-com-p-furiya-mashina-vkontakte-66.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      NavigationButton(
                        onTap: navigateToProfilePage,
                        width: 96,
                        height: 96,
                        icon: const Icon(
                          Icons.person_rounded,
                          size: 48,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(blurRadius: 8, color: Color(0xBF000000))
                          ],
                        ),
                        text: const Text(
                          "ПРОФИЛЬ",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: Image.network(
                              "https://sportishka.com/uploads/posts/2022-11/1667491843_58-sportishka-com-p-furiya-mashina-vkontakte-66.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      NavigationButton(
                        onTap: navigateToSearchPage,
                        width: 96,
                        height: 96,
                        color: const Color(0xFFC94949),
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 48,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(blurRadius: 8, color: Color(0xBF000000))
                          ],
                        ),
                        text: const Text(
                          "ПОИСК",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(height: 16),
                      NavigationButton(
                        onTap: navigateToSettingsPage,
                        width: 96,
                        height: 96,
                        color: const Color(0xFFFFFFFF),
                        icon: const Icon(
                          Icons.settings_rounded,
                          size: 48,
                          color: Color(0xFF333333),
                          shadows: [
                            BoxShadow(blurRadius: 8, color: Color(0xBF000000))
                          ],
                        ),
                        text: const Text(
                          "НАСТРОЙКИ",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10,
                              color: Color(0xFFAAAAAA),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // ContinueWatching(
            //   anime: animeExampleList,
            // ),

          ],
        ),
      ),
    );
  }
}

// class ContinueWatching extends StatefulWidget {
//   const ContinueWatching({super.key, required this.anime});
//
//   final List<Anime> anime;
//
//   @override
//   State<ContinueWatching> createState() => _ContinueWatchingState();
// }
//
// class _ContinueWatchingState extends State<ContinueWatching> {
//   void navigateToAnimePage(id) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AnimePage(id: id),
//       ),
//     );
//   }
//
//   void navigateToMangaPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const ProfilePage(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 48,
//             child: Text(
//               AppLocalizations.of(context)!.continue_watching,
//               style: const TextStyle(
//                   fontFamily: "Inter",
//                   fontSize: 24,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//           ListView.separated(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: widget.anime.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (index == 0) {
//                 return Container(
//                   height: 256,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0xFF777777),
//                         blurRadius: 16,
//                         spreadRadius: -4,
//                         offset: Offset(0, 2),
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       AnimeImage(
//                         url: widget.anime[index].imageUrl,
//                         width: MediaQuery.of(context).size.width,
//                         height: 196,
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(12),
//                           topLeft: Radius.circular(12),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 12, left: 16),
//                         child: Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.anime[index].animeTitle,
//                                   style: const TextStyle(
//                                       fontFamily: "Inter",
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 Text(
//                                   widget.anime[index].type,
//                                   style: const TextStyle(
//                                       fontFamily: "Inter",
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       color: Color(0xFF444444)),
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 16.0),
//                               child: AnimeButton(
//                                 onPressed: () => navigateToAnimePage(123),
//                                 type: widget.anime[index].type,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Container(
//                   height: 72,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: const [
//                       BoxShadow(
//                           color: Color(0xFF777777),
//                           blurRadius: 16,
//                           spreadRadius: -4,
//                           offset: Offset(0, 2))
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       AnimeImage(
//                           borderRadius: BorderRadius.circular(12),
//                           url: widget.anime[index].imageUrl,
//                           height: 64,
//                           width: 64),
//                       Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 8, left: 12),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.anime[index].animeTitle,
//                                 style: const TextStyle(
//                                     fontFamily: "Inter",
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Text(
//                                 widget.anime[index].type,
//                                 style: const TextStyle(
//                                     fontFamily: "Inter",
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xFF444444)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 16.0),
//                           child: AnimeButton(
//                             onPressed: () => navigateToAnimePage(123),
//                             type: widget.anime[index].type,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               }
//             },
//             separatorBuilder: (BuildContext context, int index) =>
//                 const SizedBox(
//               height: 8,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
