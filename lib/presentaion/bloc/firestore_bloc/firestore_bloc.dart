import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  String? imageUrl;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirestoreBloc() : super(FirestoreBlocInitial()) {
    on<AddDataToFirestoreEvent>(addDataToFirestore);
    on<AddDataToStorageCloudEvent>(addDataToStorageCloude);
  }

  Future<void> addDataToFirestore(
      FirestoreEvent event, Emitter<FirestoreState> emit) async {
    if (event is AddDataToFirestoreEvent) {
      emit(LoadingAddDataToFirestoreState());
      try {
        await _firestore.collection("users").doc(event.uid2).set({
          "userEmail": event.userEmail,
          "PhoneNumber": event.phoneNumber,
          "following": event.following,
          "followers": event.followers,
          "file": event.image,
        });
        emit(SuccessAddDataToFirestoreState(successMessage: "Success"));
      } catch (e) {
        emit(ErorrAddDataToFirestoreState(
            errorMessage: "Failed to add user: ${e.toString()}"));
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> addDataToStorageCloude(
      FirestoreEvent event, Emitter<FirestoreState> emit) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (event is AddDataToStorageCloudEvent) {
      emit(loadingAddtoStorageCloudState());

      try {
        Reference ref = storage.ref().child(event.folderName).child(
            event.uid);
        UploadTask uploadTask = ref.putData(event.file);
        TaskSnapshot snap = await uploadTask;
        String downloadUrl = await snap.ref.getDownloadURL();
        imageUrl = downloadUrl;
        print("aheddddddddddddddddddddddddddddddddddddddddddddddddd");
        print(imageUrl);

        emit(SuccessAddtoStorageCloudState());
      } catch (e) {
        emit(ErrorAddtoStorageCloudState());
        print("firassssssssssssss");
      }
    }
  }
}
