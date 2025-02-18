import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/core/usecases/usecase.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class PlaylistUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getPlaylistSongs();
  }
}
