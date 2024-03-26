import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textEditingController  = TextEditingController();
String _correctPassword = "12345";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              obscureText: true,
              decoration:  const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter your password",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofocus: true, // Focus vào TextField khi màn hình được hiển thị
              onSubmitted: (_) {
                handleSubmitted(_textEditingController.text,_correctPassword);
              },
            ),
          ],
        ),
      ),
    );
  }
  void handleSubmitted(String text,_correctPassword) {
    if (text == _correctPassword) {Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => AdminScreen()));}
    else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login"),
            content: const Text("Login failed"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );    
      
   
    }
    // if (text == _correctPassword) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: const Text("Login"),
    //         content: const Text("Login success"),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: const Text("OK"),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: const Text("Login"),
    //         content: const Text("Login failed"),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: const Text("OK"),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

  }
  @override
  void dispose() {
    _textEditingController.dispose(); // Giải phóng bộ nhớ khi widget bị loại bỏ
    super.dispose();
  }
  

}
