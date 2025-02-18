import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/common/helpers/is_dark_mode.dart';
import 'package:spotify_clean_arch/common/widgets/appbar/appbar.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';
import 'package:spotify_clean_arch/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_clean_arch/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerScreen extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerScreen({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          "Play Your Music",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()..loadSong(songEntity.music),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                _topCover(context),
                SizedBox(
                  height: 20,
                ),
                _songDetail(context),
                SizedBox(
                  height: 20,
                ),
                _songPlayer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SongPlayerError) {
        return Center(
          child: Text("Error loading song"),
        );
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(context.read<SongPlayerCubit>().songPosition),
                ),
                Text(
                  _formatDuration(context.read<SongPlayerCubit>().songDuration),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPause();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPallete.primaryColor,
                ),
                child: Icon(
                  context.read<SongPlayerCubit>().audioPlayer.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            )
          ],
        );
      }
      return Container();
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  Widget _songDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              songEntity.artist,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: context.isDarkMode ? Colors.white : Colors.grey,
          ),
          iconSize: 30,
        ),
      ],
    );
  }

  Container _topCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            songEntity.cover,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
