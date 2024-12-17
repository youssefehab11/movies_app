class UserEntity {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? wishListCount;
  int? historyCount;
  bool? isEmailVerified;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.wishListCount,
    this.historyCount,
    this.isEmailVerified,
  });
}
