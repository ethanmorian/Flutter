import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/core/usecase/usecase.dart';
import 'package:flutter_spotify/data/models/auth/create_user_req.dart';
import 'package:flutter_spotify/domain/repositories/auth/auth.dart';
import 'package:flutter_spotify/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
