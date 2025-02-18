import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clean_arch/data/models/song/song_model.dart';
import 'package:spotify_clean_arch/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlaylistSongs();
  Future<Either> addFavoriteSongs(String songId);
  Future<bool> isFavoriteSongs(String songId);
  Future<Either> getUserFavoriteSongs();
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

  @override
  Future<Either> addFavoriteSongs(String songId) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      late bool isFavorite;
      final user = firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firestore
          .collection("Users")
          .doc(uId)
          .collection("Favorites")
          .where("songId", isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firestore
            .collection("Users")
            .doc(uId)
            .collection("Favorites")
            .add({
          "songId": songId,
          "timestamp": Timestamp.now(),
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }

  @override
  Future<bool> isFavoriteSongs(String songId) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final user = firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firestore
          .collection("Users")
          .doc(uId)
          .collection("Favorites")
          .where("songId", isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<Either> getUserFavoriteSongs() async{
   try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      List<SongEntity> favoriteSongs = [];
      String uId = user!.uid;
      QuerySnapshot favoritesSnapshot = await firebaseFirestore.collection(
        'Users'
      ).doc(uId)
      .collection('Favorites')
      .get();
      
      for (var element in favoritesSnapshot.docs) { 
        String songId = element['songId'];
        var song = await firebaseFirestore.collection('Songs').doc(songId).get();
        // SongModel songModel = SongModel.fromJson(song.data()!);
        // songModel.isFavorite = true;
        // songModel.songId = songId;
        // favoriteSongs.add(
        //   songModel.toEntity()
        // );
      }
      
      return Right(favoriteSongs);

    } catch (e) {
      print(e);
      return const Left(
        'An error occurred'
      );
    }
  }
}
