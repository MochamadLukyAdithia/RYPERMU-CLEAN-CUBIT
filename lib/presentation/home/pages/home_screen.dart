import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clean_arch/common/helpers/is_dark_mode.dart';
import 'package:spotify_clean_arch/core/configs/assets/App_Image.dart';
import 'package:spotify_clean_arch/core/configs/assets/App_Svg.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';
import 'package:spotify_clean_arch/presentation/home/widgets/new_songs.dart';
import 'package:spotify_clean_arch/presentation/home/widgets/playlist_songs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> genres = [
    'Populer',
    'Jazz',
    'Rock',
    'Pop',
    'Hip-hop',
    'EDM'
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: genres.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          AppImage.imageRyper,
          height: 160,
          width: 160,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topCard(),
              const SizedBox(height: 20),
              tabBar(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    NewSongs(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
              PlaylistSongs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppPallete.primaryColor,
      padding: EdgeInsets.all(0),
      tabs: genres.map((genre) {
        return Tab(
          child: Text(
            genre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget topCard() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                color: AppPallete.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 54,
            left: width / 12,
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Album",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Birds Of A Feather",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Billie Eilish",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: width / 36,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                      AppImage.artist,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
