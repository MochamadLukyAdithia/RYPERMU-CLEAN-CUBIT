import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/core/usecases/usecase.dart';
import 'package:spotify_clean_arch/domain/repository/auth/auth.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class AddOrRemoveUsecase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().addFavoriteSongs(params!);
  }
}
