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
    'Pop',
    'Jazz',
    'Rock',
    'Popular',
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
        title: SvgPicture.asset(
          AppSvg.logo,
          height: 40,
          width: 40,
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
    return Container(
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppSvg.homeTopChart,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 0.3,
              right: 40,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppImage.homeArtist,
              ),
            ),
          )
        ],
      ),
    );
  }
}
