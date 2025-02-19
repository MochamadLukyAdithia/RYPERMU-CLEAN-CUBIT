import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/core/usecases/usecase.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class IsFavoriteUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongRepository>().isFavoriteSongs(params!);
  }
}
