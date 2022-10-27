part of 'firestore_bloc.dart';

abstract class FirestoreEvent extends Equatable {
  const FirestoreEvent();

  @override
  List<Object> get props => [];
}

class AddDataToFirestoreEvent extends FirestoreEvent {
  final String? uid2;
  final String? userName;
  final String? userEmail;
  final String? phoneNumber;
  final List? following;
  final List? followers;
  final String? image;

  AddDataToFirestoreEvent(
      {required this.uid2,
      this.image,
      this.userName,
      this.userEmail,
      this.phoneNumber,
      this.following,
      this.followers});
}

// class GetDataFromFirestoreEvent extends FirestoreEvent {
//   final String? userName;
//   final String? userEmail;
//   final String? phoneNumber;
//   final List? following;
//   final List? followers;
//   // final Uint8List file;

//   GetDataFromFirestoreEvent(
//       {this.userName,
//       // required this.file,
//       this.userEmail,
//       this.phoneNumber,
//       this.following,
//       this.followers});
// }
///////////////////////////////////////////////////////////////////////////////
class AddDataToStorageCloudEvent extends FirestoreEvent {
  final String uid;
  final String folderName;
  final Uint8List file;
  final bool isPaass;

  AddDataToStorageCloudEvent({
    required this.folderName,
    required this.uid,
    required this.file,
    required this.isPaass,
  });
}
