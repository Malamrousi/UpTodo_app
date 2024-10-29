class LoginUserInfoModel {
  final String? displayName;
  final String? email;
  final String? uid;

  LoginUserInfoModel({this.displayName, this.email, this.uid});

  factory LoginUserInfoModel.fromJson(Map<String, dynamic> json) {
    return LoginUserInfoModel(
      displayName: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': displayName,
        'email': email,
        'uid': uid,
      };
}
