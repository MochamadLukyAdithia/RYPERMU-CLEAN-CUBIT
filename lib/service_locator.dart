import 'package:get_it/get_it.dart';
import 'package:spotify_clean_arch/common/bloc/favorite/favoritw_button_cubit.dart';
import 'package:spotify_clean_arch/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_clean_arch/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clean_arch/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clean_arch/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clean_arch/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clean_arch/domain/repository/auth/auth.dart';
import 'package:spotify_clean_arch/domain/repository/song/song_repository.dart';
import 'package:spotify_clean_arch/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/auth/signup_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/song/add_or_remove_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/song/get_user_favorite_songs_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/song/is_favorite_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/song/playlist_usecase.dart';
import 'package:spotify_clean_arch/domain/usecase/song/song_usecase.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //Auth
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  // Songs
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<SongUsecase>(SongUsecase());
  //playlist
  sl.registerSingleton<PlaylistUsecase>(PlaylistUsecase());
  //Favorite
  sl.registerSingleton<AddOrRemoveUsecase>(AddOrRemoveUsecase());
  sl.registerSingleton<IsFavoriteUsecase>(IsFavoriteUsecase());
  sl.registerSingleton<GetUserFavoriteSongsUsecase>(
      GetUserFavoriteSongsUsecase());
}
