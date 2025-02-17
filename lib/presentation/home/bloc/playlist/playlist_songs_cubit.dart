import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/domain/usecase/song/playlist_usecase.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/playlist/playlist_songs_state.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class PlaylistSongsCubit extends Cubit<PlaylistSongsState> {
  PlaylistSongsCubit() : super(PlaylistLoading());
  Future<void> playListSongs() async {
    var result = await sl<PlaylistUsecase>().call();
    result.fold((i) {
      emit(PlaylistError());
    }, (r) {
      emit(PlaylistLoaded(songs: r));
    });
  }
}
