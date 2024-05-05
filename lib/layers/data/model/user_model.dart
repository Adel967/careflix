import 'package:careflix/core/enum.dart';

class UserModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  Gender? gender;
  String? createdAt;
  String? pushToken;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.gender,
      required this.createdAt,
      required this.pushToken});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'birthDate': this.birthDate,
      'gender': genderToString(this.gender!),
      'createdAt': this.createdAt,
      'pushToken': this.pushToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      birthDate: map['birthDate'],
      gender: stringToGender(map['gender']),
      createdAt: map['createdAt'],
      pushToken: map['pushToken'],
    );
  }
}
