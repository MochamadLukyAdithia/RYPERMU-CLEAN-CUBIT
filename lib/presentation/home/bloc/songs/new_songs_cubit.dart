import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/domain/usecase/song/song_usecase.dart';
import 'package:spotify_clean_arch/presentation/home/bloc/songs/new_songs_state.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());
  Future<void> getNewSongs() async {
    var returnedSongs = await sl<SongUsecase>().call();
    returnedSongs.fold((l) {
      emit(NewSongsError());
    }, (data) {
      emit(NewSongsLoaded(songs: data));
    });
  }
}
