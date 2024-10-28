class LoginUserInfoModel {
  final String? displayName;
  final String? email;

  LoginUserInfoModel({
    this.displayName,
    this.email,
  });

  factory LoginUserInfoModel.fromJson(Map<String, dynamic> json) {
    return LoginUserInfoModel(
      displayName: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': displayName,
        'email': email,
      };
}
