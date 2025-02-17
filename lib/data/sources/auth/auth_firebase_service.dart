import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clean_arch/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUseReq);
  Future<Either> signin(CreateUserReq createUseReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(CreateUserReq createUseReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: createUseReq.email, password: createUseReq.password);
      return Right("User signed in successfully");
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUseReq) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUseReq.email,
        password: createUseReq.password,
      );
      FirebaseFirestore.instance.collection("Users").add({
        'name': createUseReq.fullName,
        'email': data.user?.email,
      });

      return Right("User created successfully");
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }
}
