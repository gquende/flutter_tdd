import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/core/error/failures.dart';

abstract class Usecase<Type, Input> {
  Future<Either<Failure, Type>> call(Input input);
}