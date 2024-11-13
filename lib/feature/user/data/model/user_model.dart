class UserModel {
  final String? displayName;
  final String? email;
  final String? uid;

  UserModel({this.displayName, this.email, this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
