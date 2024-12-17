import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/domain/entities/user.dart';

class UserDto {
  static const String usersCollection = 'Users';
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  bool? isEmailVerified;
  int? wishListCount;
  int? historyCount;

  UserDto({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.isEmailVerified = false,
    this.wishListCount = 0,
    this.historyCount = 0,
  });

  factory UserDto.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserDto(
        id: data?['id'],
        name: data?['name'],
        email: data?['email'],
        phoneNumber: data?['phoneNumber'],
        isEmailVerified: data?['isEmailVerified'],
        wishListCount: data?['wishListCount'],
        historyCount: data?['historyCount']);
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (isEmailVerified != null) "isEmailVerified": isEmailVerified,
      if (wishListCount != null) "wishListCount": wishListCount,
      if (historyCount != null) "historyCount": historyCount,
    };
  }

  UserEntity toUser() {
    return UserEntity(
        email: email,
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        historyCount: historyCount,
        wishListCount: wishListCount,
        isEmailVerified: isEmailVerified);
  }
}
