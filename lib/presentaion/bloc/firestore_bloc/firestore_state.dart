part of 'firestore_bloc.dart';

abstract class FirestoreState extends Equatable {
  const FirestoreState();

  @override
  List<Object> get props => [];
}

class FirestoreBlocInitial extends FirestoreState {}

////////////////////////////////////////////////////////////////////////
class LoadingAddDataToFirestoreState extends FirestoreState {}

class SuccessAddDataToFirestoreState extends FirestoreState {
  final String successMessage;

  SuccessAddDataToFirestoreState({required this.successMessage});
}

class ErorrAddDataToFirestoreState extends FirestoreState {
  final String errorMessage;

  ErorrAddDataToFirestoreState({required this.errorMessage});
}

////////////////////////////////////////////////////////////////////////
class LoadingGetDataFromFirestoreState extends FirestoreState {}

class SuccesGetDataFromFirestoreState extends FirestoreState {
  final String successMessage;

  SuccesGetDataFromFirestoreState({required this.successMessage});
}

class ErrorGetDataFromFirestoreState extends FirestoreState {
  final String errorMessage;

  ErrorGetDataFromFirestoreState({required this.errorMessage});
}

////////////////////////////////////////////////////////////////////////
class loadingAddtoStorageCloudState extends FirestoreState {}

class SuccessAddtoStorageCloudState extends FirestoreState {}

class ErrorAddtoStorageCloudState extends FirestoreState {}
