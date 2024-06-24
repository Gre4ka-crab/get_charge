import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/network/network_info.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_profile_datasorces.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';
import 'package:get_charge/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  RemoteProfileDataSources profileDataSources;
  NetworkInfo networkInfo;

  ProfileRepositoryImpl({required this.profileDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    var isConnected = await networkInfo.isConnected;
    if(isConnected){
      try {
        var response = await profileDataSources.getProfile();
        return Right(response);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }

  }

  @override
  Future<Either<Failure, void>> changeEmail(String email) async {
    var isConnected = await networkInfo.isConnected;
    if(isConnected){
      try {
        await profileDataSources.changeProfile(email);
        return const Right(null);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile() async {
    var isConnected = await networkInfo.isConnected;
    if(isConnected){
      try {
        await profileDataSources.deleteProfile();
        return const Right(null);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

}