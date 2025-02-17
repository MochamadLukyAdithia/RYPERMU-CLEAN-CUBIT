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
}
