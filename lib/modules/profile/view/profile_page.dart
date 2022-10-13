import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meu perfil'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Perfil')
            )
        )
    );
  }
}
