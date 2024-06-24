part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}


class ProfileLoaded extends ProfileState {
  final ProfileEntity profileEntity;

  ProfileLoaded({required this.profileEntity});
}

class ProfileError extends ProfileState {
  final Failure error;

  ProfileError({required this.error});
}

class ProfileExit extends ProfileState {}