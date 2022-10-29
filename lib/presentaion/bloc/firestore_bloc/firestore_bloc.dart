import 'dart:async';
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
  final FirebaseStorage storage = FirebaseStorage.instance;

  Map<String, dynamic>? data;
  String? nn;

  String? downloadUrl;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirestoreBloc() : super(FirestoreBlocInitial()) {
    on<AddDataToStorageCloudEvent>(addDataToStorageCloude);
    on<AddDataToFirestoreEvent>(addDataToFirestore);

    on<GetDataFromFirestoreEvent>(GetDataFromFirestore);
  }

  Future<void> addDataToFirestore(
      FirestoreEvent event, Emitter<FirestoreState> emit) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (event is AddDataToFirestoreEvent) {
      emit(LoadingAddDataToFirestoreState());
      try {
        await _firestore.collection("users").doc(event.uid2).set({
          "userName": event.userName,
          "userEmail": event.userEmail,
          "PhoneNumber": event.phoneNumber,
          "following": event.following,
          "followers": event.followers,
          // "image": event.image,
          "image": downloadUrl,
        });
        emit(SuccessAddDataToFirestoreState(successMessage: "Success"));
      } catch (e) {
        emit(ErorrAddDataToFirestoreState(
            errorMessage: "Failed to add user: ${e.toString()}"));
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> GetDataFromFirestore(
      FirestoreEvent event, Emitter<FirestoreState> emit) async {
    if (event is GetDataFromFirestoreEvent) {
      emit(LoadingGetDataFromFirestoreState());
      try {
        DocumentSnapshot snap =
            await _firestore.collection("users").doc(event.uid).get();
        data = (snap.data() as Map<String, dynamic>);
        String userEmail2 = data!['userEmail'];
        print("aaaaaaaaaaaaaaaa$userEmail2");

        emit(SuccesGetDataFromFirestoreState(successMessage: "Success"));
      } catch (e) {
        emit(ErrorGetDataFromFirestoreState(
            errorMessage: "Failed to add user: ${e.toString()}"));
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> addDataToStorageCloude(
      FirestoreEvent event, Emitter<FirestoreState> emit) async {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    if (event is AddDataToStorageCloudEvent) {
      emit(loadingAddtoStorageCloudState());

      try {
        Reference ref = storage
            .ref()
            .child(event.folderName)
            .child("//instgram-clone-2e7e9.appspot.com/");
        UploadTask uploadTask = ref.putData(event.file);
        TaskSnapshot snap = await uploadTask;
        downloadUrl = await snap.ref.getDownloadURL();
        // print("aheddddddddddddddddddddddddddddddddddddddddddddddddd");
        print(downloadUrl);

        emit(SuccessAddtoStorageCloudState());
      } catch (e) {
        emit(ErrorAddtoStorageCloudState());
        print("firassssssssssssss");
      }
    }
  }
}
