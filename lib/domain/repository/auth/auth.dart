import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(CreateUserReq createUserReq);
}
