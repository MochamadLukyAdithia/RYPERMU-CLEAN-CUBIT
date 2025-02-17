import 'package:dartz/dartz.dart';
import 'package:spotify_clean_arch/core/usecases/usecase.dart';
import 'package:spotify_clean_arch/data/models/auth/create_user_req.dart';
import 'package:spotify_clean_arch/domain/repository/auth/auth.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params})async {
    return await sl<AuthRepository>().signup(params!);
  }
}
