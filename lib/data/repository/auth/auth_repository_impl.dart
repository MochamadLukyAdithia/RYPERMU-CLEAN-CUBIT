import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/data/models/auth/create_user_req.dart';
import 'package:spotify_clean_arch/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clean_arch/domain/repository/auth/auth.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> signin(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signin(createUserReq);
  }
}
