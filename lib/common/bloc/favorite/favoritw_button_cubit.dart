import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clean_arch/common/bloc/favorite/favorite_button_state.dart';
import 'package:spotify_clean_arch/domain/usecase/song/add_or_remove_usecase.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());
  Future<void> favoriteButtonUpdated(String songId) async {
    var result = await sl<AddOrRemoveUsecase>().call(
      params: songId
    );
    result.fold((i) {
      emit(FavoriteButtonDeleted());
    }, (isFvaorite) {
      emit(FavoriteButtonUpdated(isFavorite: isFvaorite));
    });
  }
}
