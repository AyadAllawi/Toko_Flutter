import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/preference/shared_preference.dart';
import 'package:flutter_toko_sederhana/views/login.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacement(Login());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.all(16.0),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      child: Text("Logout"),
    );
  }
}
