import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'add_image_event.dart';
part 'add_image_state.dart';

class AddImageBloc extends Bloc<AddImageEvent, AddImageState> {
  Uint8List? imageFromGalary;
  AddImageBloc() : super(AddImageInitial()) {
    on<AddImageFromGallaryEvent>(AddImage);
  }
  Future<void> AddImage(
    AddImageEvent event,
    Emitter<AddImageState> emit,
  ) async {
    if (event is AddImageFromGallaryEvent) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? gallary = await imagePicker.pickImage(source: event.imageSource);
      try {
        if (gallary != null) {
          Uint8List e = await gallary.readAsBytes();
          imageFromGalary = e;

          emit(SuccssAddImageFromGallaryState());
        }
      } catch (e) {
        emit(ErorrAddImageFromGallaryState());
      }
    }
  }
}
