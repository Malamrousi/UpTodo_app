class UserInfoModel {
  final String? name;
  final String? email;
  final String? uid;

  UserInfoModel({this.name, this.email, this.uid});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
      };
}
