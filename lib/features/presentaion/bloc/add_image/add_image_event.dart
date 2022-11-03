part of 'add_image_bloc.dart';

abstract class AddImageEvent extends Equatable {
  const AddImageEvent();

  @override
  List<Object> get props => [];
}

class AddImageFromGallaryEvent extends AddImageEvent {
  final ImageSource imageSource;

  AddImageFromGallaryEvent({required this.imageSource});
}