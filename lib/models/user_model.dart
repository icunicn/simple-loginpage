class UserModel {
  final int? id;
  final String email;
  final String passwordHash;
  final String salt;

  UserModel({
    this.id,
    required this.email,
    required this.passwordHash,
    required this.salt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'passwordHash': passwordHash,
      'salt': salt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      passwordHash: map['passwordHash'],
      salt: map['salt'],
    );
  }
}
