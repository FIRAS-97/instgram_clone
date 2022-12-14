part of 'add_image_bloc.dart';

abstract class AddImageState extends Equatable {
  const AddImageState();

  @override
  List<Object> get props => [];
}

class AddImageInitial extends AddImageState {}

class LoadingAddImageFromGallaryState extends AddImageState {}

class SuccssAddImageFromGallaryState extends AddImageState {}

class ErorrAddImageFromGallaryState extends AddImageState {}
