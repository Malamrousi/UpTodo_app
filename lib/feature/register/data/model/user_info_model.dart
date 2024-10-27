class UserInfoModel {
  final String? displayName;
  final String? email;
  final String? uid;

  UserInfoModel({this.displayName, this.email, this.uid});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
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
