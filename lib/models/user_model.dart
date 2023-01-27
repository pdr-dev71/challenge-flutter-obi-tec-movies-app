class UserModel {
  final String? profileImage;
  final String? uid;
  final String? name;
  final String? email;

  UserModel({
    this.profileImage,
    this.uid,
    this.name,
    this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      profileImage: data['profileImage'],
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profileImage': profileImage,
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
