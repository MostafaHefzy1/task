class UserModel {
  String? userId, email, name;

  UserModel({
    this.userId,
    this.email,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }
}
