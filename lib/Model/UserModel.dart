class UserModel {
  String? userID;
  String? userName;
  String? userEmail;
  String? userPassword;

  UserModel(this.userID, this.userName, this.userEmail, this.userPassword);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'UserID': userID,
      'UserName': userName,
      'UserEmail': userEmail,
      'UserPassword': userPassword
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userID = map['UserID'];
    userName = map['UserName'];
    userEmail = map['UserEmail'];
    userPassword = map['UserPassword'];
  }
}
