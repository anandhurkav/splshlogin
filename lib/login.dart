import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:splshlogin/image_picker_screen.dart';
import 'package:splshlogin/signup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  Future<File?> getCompressedImage(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 80);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Login to your account",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Email',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Password',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Signup()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ))
                  ],
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImagePickerPage()));
                      },
                      child: Image.network(
                          'https://img.icons8.com/ios-filled/256/image.png'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
