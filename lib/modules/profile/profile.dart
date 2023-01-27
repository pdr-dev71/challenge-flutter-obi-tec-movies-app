import 'package:flutter/material.dart';
import 'package:movies_go/core/ui/widgets/custom_app_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(
        title: Text('Perfil'),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
