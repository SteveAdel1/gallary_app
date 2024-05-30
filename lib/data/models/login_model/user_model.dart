class UserModel {
  String email;
  String name;
  String id;
  String token;

  UserModel({
    required this.email,
    required this.name,
    required this.id,
    required this.token

  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["data"]['user']['name'],
      email: json["data"]['user']['email'],
      id: json["data"]['user']['id'].toString(),
      token: json["data"]['token'],
    );
  }
  @override
  String toString() {
    return 'user{$this}';
  }

}
