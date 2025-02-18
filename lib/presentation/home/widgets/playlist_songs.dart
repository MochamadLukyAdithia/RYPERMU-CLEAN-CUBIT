import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/common/helpers/is_dark_mode.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/playlist/playlist_songs_cubit.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/playlist/playlist_songs_state.dart';
import 'package:spotify_clean_arch/presentation/song_player/pages/song_player.dart';

class PlaylistSongs extends StatelessWidget {
  const PlaylistSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistSongsCubit()..playListSongs(),
      child: BlocBuilder<PlaylistSongsCubit, PlaylistSongsState>(
          builder: (context, state) {
        if (state is PlaylistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PlaylistError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (state is PlaylistLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Playlist',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _songs(state.songs)
              ],
            ),
          );
        }
        return Container(
          child: Text("Empty"),
        );
      }),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongPlayerScreen(
                    songEntity: songs[index],
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppPallete.darkGreyColor
                              : const Color(0xffE6E6E6)),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          songs[index].artist,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 11),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      songs[index]
                          .duration
                          .toString()
                          .replaceAll('.', ':')
                          .padLeft(2, "0")
                          .padRight(2, "0"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: songs.length);
  }
}
