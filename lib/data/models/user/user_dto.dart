import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/domain/entities/user.dart';

class UserDto {
  static const String usersCollection = 'Users';
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  bool? emailVerfied;

  UserDto({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.emailVerfied = false,
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
      emailVerfied: data?['emailVerfied'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (emailVerfied != null) "emailVerfied": emailVerfied,
    };
  }

  UserEntity toUser() {
    return UserEntity(
      email: email,
      id: id,
      name: name,
      phoneNumber: phoneNumber,
    );
  }
}
