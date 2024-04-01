import 'package:flutter/material.dart';
import 'package:shop/admin-app.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        //,
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
  final FocusNode _passwordFocusNode = FocusNode(); // FocusNode cho TextField

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
    'VI',
    'DEL',
  ];

  @override
  void dispose() {
    _passwordFocusNode.dispose(); // Giải phóng FocusNode khi widget bị dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpg'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final passwordFieldHeight =
                  constraints.maxHeight * 0.4; // 20% của chiều cao màn hình
              final buttonWidth = MediaQuery.of(context).size.width /
                  3.2; // Chiều rộng của mỗi ô được chia đều thành 3 cột
              final buttonHeight =
                  (constraints.maxHeight - passwordFieldHeight) /
                      6; // Phần còn lại của chiều cao màn hình được chia cho 5
              return GestureDetector(
                onTap: () {
                  _passwordFocusNode
                      .unfocus(); // Mất focus khi chạm vào ngoài TextField
                },
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: buttonWidth, width: buttonWidth),
                              Container(
                                child: const Row(
                                  children: [
                                    Icon(Icons.key, size: 24),
                                    SizedBox(width: 8, height: 8),
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: constraints.maxWidth * 0.93,
                                child: TextField(
                                  focusNode:
                                      _passwordFocusNode, // Gán FocusNode
                                  decoration: InputDecoration(
                                    labelText: 'Enter your password',
                                    errorText: errorMessage.isNotEmpty
                                        ? errorMessage
                                        : null,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2.0),
                                    ),
                                  ),
                                  controller:
                                      TextEditingController(text: userInput),
                                  keyboardType: TextInputType.none,
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      userInput = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.07,
                                left: 10),
                            width: double.infinity,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 1.0,
                              runSpacing: 1.0,
                              children: buttons.map((text) {
                                return SizedBox(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      handle(text);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10, // Độ nổi của nút
                                      backgroundColor:
                                          Colors.grey.shade300, // Màu nền),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: CustomButton(text: text),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget CustomButton({required String text}) {
    return Center(
      child: text == 'GE'
          ? Image.asset(
              'assets/image/ge_flag.jpg',
              width: 24,
              height: 24,
            )
          : text == 'VI'
              ? Image.asset(
                  'assets/image/vi_flag.png',
                  width: 24,
                  height: 24,
                )
              : Text(
                  text,
                  style: TextStyle(fontSize: 24, color: getColor(text)),
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
          errorMessage = '';
        }
      });
    } else if (text == 'enter') {
      process();
    } else if (text != 'ESC' &&
        text != 'DEL' &&
        text != 'enter' &&
        text != 'GE' &&
        text != 'VI') {
      setState(() {
        userInput += text;
        errorMessage = '';
      });
    }
  }

  process() {
    if (userInput == _correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminApp(),
        ),
      );
    } else {
      setState(() {
        errorMessage = 'Kindly enter the correct password';
      });
    }
  }
}
