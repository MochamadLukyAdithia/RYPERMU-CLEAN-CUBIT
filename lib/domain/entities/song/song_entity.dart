import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  String artist;
  String title;
  String music;
  String cover;
  num duration;
  Timestamp releaseDate;
  SongEntity({
    required this.artist,
    required this.title,
    required this.music,
    required this.cover,
    required this.duration,
    required this.releaseDate,
  });
}
