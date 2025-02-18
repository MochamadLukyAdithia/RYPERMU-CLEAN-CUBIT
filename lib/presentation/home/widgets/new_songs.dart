import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/common/helpers/is_dark_mode.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/songs/new_songs_cubit.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/songs/new_songs_state.dart';
import 'package:spotify_clean_arch/presentation/song_player/pages/song_player.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NewSongsCubit()..getNewSongs(),
        child: SizedBox(
          height: 200,
          child: BlocBuilder<NewSongsCubit, NewSongsState>(
              builder: (context, state) {
            if (state is NewSongsError) {
              return Center(child: Text('Error loading new songs'));
            }
            if (state is NewSongsLoaded) {
              return _buildNewSongsList(state.songs);
            }
            if (state is NewSongsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Container(
              child: Text('No new songs available'),
            );
          }),
        ));
  }

  Widget _buildNewSongsList(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final dataSong = songs[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongPlayerScreen(
                  songEntity: dataSong,
                ),
              ),
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(dataSong.cover),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(3, 3, 0),
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? Colors.grey.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${dataSong.artist}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${dataSong.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 20,
        );
      },
      itemCount: songs.length,
    );
  }
}
