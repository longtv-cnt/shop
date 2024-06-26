import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();
    keys = [
      ['7', '8', '9'],
      ['4', '5', '6'],
      ['1', '2', '3'],
      [
        '0',
        'ESC',
        Text(
          'enter',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ];
    amount = '';
  }

  onKeyTap(val) {
    if (val == '0' && amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount + val;
    });
  }

  onESC(String val) {
    if (val == 'ESC' ) {
      return Navigator.pop(context);
    }

    setState(() {
     
    });
  }

  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = 'Enter password';
    TextStyle style = const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    if (amount.isNotEmpty) {
      // NumberFormat f = NumberFormat('#,###');
      display = amount;
      // display = f.format(int.parse(amount));
      style = style.copyWith(
        color: Colors.black,
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  // renderConfirmButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //     child: GestureDetector(
  //       onTap: amount.isNotEmpty ? () {} : null,
  //       child: Container(
  //         height: 50.0,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           color: amount.isNotEmpty ? Colors.blue : Colors.grey,
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: Center(
  //           child: Text(
  //             'Submit',
  //             style: TextStyle(
  //               color: amount.isNotEmpty ? Colors.white : Colors.black,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              renderAmount(),
              ...renderKeyboard(),
              const SizedBox(
                height: 10,
              ),
              //renderConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
