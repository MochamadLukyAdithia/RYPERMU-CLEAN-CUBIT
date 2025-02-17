import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clean_arch/core/usecases/usecase.dart';
import 'package:spotify_clean_arch/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class SongUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewSongs();
  }
}
