import 'package:flutter/material.dart';
import 'package:shop/admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String _correctPassword = '12345';
  String errorMessage = '';

  List<String> buttons = [
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '0',
    'ESC',
    'enter',
    'GE',
    'VI'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 249, 249),
        body: Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.access_alarms),
                      // ),
                      Icon(Icons.key, size: 30),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 100),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.more_vert),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)),
                        labelText: 'Enter your password',
                        errorText:
                            errorMessage.isNotEmpty ? errorMessage : null,
                      ),
                      obscureText: true,
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      controller: TextEditingController(text: userInput),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0, // Adjust this value
                    mainAxisSpacing: 2.0, // Adjust this value
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomButton(
                      text: buttons[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomButton({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        splashColor: Colors.lightGreen,
        onTap: () {
          setState(() {
            handle(text);
          });
        },
        child: Ink(
          // width: 0.1,
          // height: 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 243, 243),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Center(
            child: text == 'GE'
                ? Image.asset(
                    'assets/image/ge_flag.jpg',
                    width: 24,
                    height: 24,
                  )
                : text == 'VI'
                    ? Image.asset(
                        'assets/image/vi_flag.png', //
                        width: 24,
                        height: 24,
                      )
                    : Text(
                        text,
                        style: TextStyle(fontSize: 27, color: getColor(text)),
                      ),
          ),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == 'enter') {
      return Colors.red;
    }
    return const Color.fromARGB(255, 2, 2, 2);
  }

  handle(String text) {
    if (text == 'AC') {
      setState(() {
        userInput = '';
      });
    } else if (text == 'DEL') {
      setState(() {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      });
    } else if (text == 'enter') {
      process();
    } else if (text != 'ESC' && text != 'DEL' && text != 'enter') {
      setState(() {
        userInput += text;
      });
    }
  }

  process() {
    if (userInput == _correctPassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminApp()));
    }
    if (userInput != _correctPassword) {
      setState(() {
        errorMessage = 'Kindly enter the correct password';
      });
    }
  }
}
