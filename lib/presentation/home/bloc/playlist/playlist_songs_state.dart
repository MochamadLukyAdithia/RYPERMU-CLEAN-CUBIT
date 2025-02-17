import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';

abstract class PlaylistSongsState {}

class PlaylistLoading extends PlaylistSongsState {}

class PlaylistLoaded extends PlaylistSongsState {
  final List<SongEntity> songs;
  PlaylistLoaded({required this.songs});
}

class PlaylistError extends PlaylistSongsState {}
