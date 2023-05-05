class UserModel {
  String? userID;
  String? userName;
  String? userEmail;
  String? userPassword;

  UserModel(this.userID, this.userName, this.userEmail, this.userPassword);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': userID,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userID = map['user_id'];
    userName = map['user_name'];
    userEmail = map['user_email'];
    userPassword = map['user_password'];
  }
}
