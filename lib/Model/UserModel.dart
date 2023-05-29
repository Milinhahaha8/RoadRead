import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? userPassword;

  String? referenceId;

  UserModel(this.userName, this.userPassword);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'UserName': userName,
      'UserPassword': userPassword
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userName = map['UserName'];
    userPassword = map['UserPassword'];
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newUser = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newUser.referenceId = snapshot.reference.id;
    return newUser;
  }
  // 6
  factory UserModel.fromJson(Map<String, dynamic> json) => _userFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _userToJson(this);
}

// 1
UserModel _userFromJson(Map<String, dynamic> json) {
  return UserModel(json['userName'] as String, json['userPassword'] as String);
}

// 3
Map<String, dynamic> _userToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'userPassword': instance.userPassword,
    };
