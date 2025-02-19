import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';

class SongModel {
  String? artist;
  String? title;
  String? music;
  String? cover;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;
  SongModel({
    required this.artist,
    required this.title,
    required this.music,
    required this.cover,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.songId,
  });
  SongModel.fromJson(Map<String, dynamic> data) {
    artist = data['artist'];
    title = data['title'];
    music = data['music'];
    cover = data['cover'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      artist: artist!,
      title: title!,
      music: music!,
      cover: cover!,
      duration: duration!,
      releaseDate: releaseDate!,
      songId: songId!,
      isFavorite: isFavorite!,
    );
  }
}
