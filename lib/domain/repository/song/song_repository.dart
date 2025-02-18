import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();
  Future<Either> getPlaylistSongs();
  Future<Either> addFavoriteSongs(String songId);
  Future<bool> isFavoriteSongs(String songId);
  Future<Either> getUserFavoriteSongs();
}
