import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';

abstract class NewSongsState {}

class NewSongsLoading extends NewSongsState {}

class NewSongsLoaded extends NewSongsState {
  final List<SongEntity> songs;
  NewSongsLoaded({required this.songs});
}

class NewSongsError extends NewSongsState {}
