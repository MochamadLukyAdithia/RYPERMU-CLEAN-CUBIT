import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/data/models/song/song_model.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlaylistSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();
      for (var i in data.docs) {
        var songModel = SongModel.fromjson(i.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }

  @override
  Future<Either> getPlaylistSongs() async {
    try {
      List<SongEntity> songs = [];
      var playlist = await FirebaseFirestore.instance.collection("Songs").get();
      for (var element in playlist.docs) {
        var songModel = SongModel.fromjson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on FirebaseException catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }
}
