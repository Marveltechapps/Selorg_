part of '../cubit/profile_cubit.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  String name;
  String email;
  ProfileLoaded(this.name, this.email);
}

class ProfileLoadingFailed extends ProfileState {}

class ProfileSaved extends ProfileState {}

class ProfileSaveError extends ProfileState {}