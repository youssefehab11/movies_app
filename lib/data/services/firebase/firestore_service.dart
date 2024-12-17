import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/user/user_dto.dart';

@singleton
class FireStoreServies {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<UserDto?> getUserFromFireStore(String userId) async {
    final ref =
        db.collection(UserDto.usersCollection).doc(userId).withConverter(
              fromFirestore: UserDto.fromFirestore,
              toFirestore: (UserDto user, _) => user.toFirestore(),
            );
    final docSnap = await ref.get();
    return docSnap.data();
  }

  Future<void> saveUserToFireStore(UserDto user) async {
    final docRef = db
        .collection(UserDto.usersCollection)
        .withConverter(
          fromFirestore: UserDto.fromFirestore,
          toFirestore: (UserDto user, options) => user.toFirestore(),
        )
        .doc(user.id);
    await docRef.set(user);
  }
}
