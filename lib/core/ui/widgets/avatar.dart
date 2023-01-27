import 'package:flutter/material.dart';
import 'package:movies_go/models/user_model.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.user, {super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'User Avatar Image',
      child: CircleAvatar(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        radius: 70.0,
        child: ClipOval(
          child: Image.network(
            user.profileImage!,
            fit: BoxFit.cover,
            width: 120.0,
            height: 120.0,
          ),
        ),
      ),
    );
  }
}
