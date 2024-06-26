import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({Key? key, 
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {

  renderLabel(){
    if(widget.label is Widget){
      return widget.label;
    }

    return Text(
      widget.label,
      style:const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      if (widget.value!='enter' && widget.value!='ESC') {
      widget.onTap(widget.value);  
      }  
        if(widget.value == 'ESC'){
          //Navigator.of(context).pop();
          Navigator.pop(context);
          if (widget.value == 'enter') {
            print('Amount: done');
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Center(
          child: renderLabel(),
        ),
      ),
    );
  }
}