import 'package:anilandia/widgets/custom_sliding.dart';
import 'package:anilandia/widgets/image_with_round_corners.dart';
import 'package:flutter/material.dart';
import 'package:anilandia/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String imageUrl = "https://i.ytimg.com/vi/YO88SHRHuwc/maxresdefault.jpg";

class _ProfilePageState extends State<ProfilePage> {
  late PanelController _pc;
  late PanelController _pc1;
  late PanelController _pc2;

  @override
  void initState() {
    super.initState();
    _pc = PanelController();
    _pc1 = PanelController();
    _pc2 = PanelController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pc.panelPosition = 0.55;
      _pc1.panelPosition = 0.55;
      _pc2.panelPosition = 0.55;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          InkWell(
              onTap: () => {
                    _pc.animatePanelToPosition(0.55),
                    _pc1.animatePanelToPosition(0.55),
                    _pc2.animatePanelToPosition(0.55)
                  },
              child: Image.network(imageUrl, fit: BoxFit.cover)),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 128),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4, left: 180),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ogorodnik | 庭師",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        Text("Истинный анимешник (100)",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 119, 119, 119)))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.about_me,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                              "Аниме - это жизнь.\nА вообще я программист C++ и ищу работу"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromARGB(50, 0, 0, 0), blurRadius: 8)
                  ]),
              margin: const EdgeInsets.only(top: 64, left: 32),
              child: AnimeImage(
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  width: 128,
                  height: 128,
                  url: imageUrl),
            ),
          ),
          CustomSlidingUpPanel(
            minHeight: 196,
            maxHeight: MediaQuery.of(context).size.height - 64,
            color: Utils.dark_1,
            controller: _pc,
            onTap: () => {
              if (_pc.isPanelOpen && !_pc1.isPanelOpen)
                {
                  _pc.animatePanelToPosition(0.55),
                  _pc1.animatePanelToPosition(0.55),
                  _pc2.animatePanelToPosition(0.55)
                }
              else
                {_pc.open(), _pc1.close(), _pc2.close()}
            },
            header: PanelHeader(
                title: "${AppLocalizations.of(context)!.watching}\t\t",
                color: Utils.dividerDark_1,
                count: "3"),
            container: Container(),
          ),
          CustomSlidingUpPanel(
            minHeight: 128,
            maxHeight: MediaQuery.of(context).size.height - 128,
            color: Utils.dark_2,
            controller: _pc1,
            onTap: () => {
              if (_pc1.isPanelOpen && !_pc2.isPanelOpen)
                {_pc1.close(), _pc2.close()}
              else
                {_pc.open(), _pc1.open(), _pc2.close()}
            },
            header: PanelHeader(
                title: "${AppLocalizations.of(context)!.will_watch}\t\t",
                color: Utils.dividerDark_2,
                count: "11"),
            container: Container(),
          ),
          CustomSlidingUpPanel(
            minHeight: 64,
            maxHeight: MediaQuery.of(context).size.height - 192,
            color: Utils.dark_3,
            controller: _pc2,
            onTap: () => {
              if (_pc2.isPanelOpen)
                {_pc2.close()}
              else
                {_pc.open(), _pc1.open(), _pc2.open()}
            },
            header: PanelHeader(
                title: "${AppLocalizations.of(context)!.watched}\t\t",
                color: Utils.dividerDark_3,
                count: "86"),
            container: Container(),
          ),
        ],
      ),
    );
  }
}
