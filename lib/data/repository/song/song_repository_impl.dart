import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clean_arch/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlaylistSongs() async {
    return await sl<SongFirebaseService>().getPlaylistSongs();
  }

  @override
  Future<Either> addFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addFavoriteSongs(songId);
  }

  @override
  Future<bool> isFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSongs(songId);
  }
  
  @override
  Future<Either> getUserFavoriteSongs() async{
   return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}
