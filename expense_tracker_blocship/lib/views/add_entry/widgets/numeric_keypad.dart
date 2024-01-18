import 'package:flutter/material.dart';

void input(String text, TextEditingController controller) {
  final value = controller.text + text;
  controller.text = value;
}

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({super.key, required this.controller});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 1
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            keyboardButton('1'),
            keyboardButton('2'),
            keyboardButton('3'),
          ],
        ),
        Row(
          children: [
            keyboardButton('4'),
            keyboardButton('5'),
            keyboardButton('6'),
          ],
        ),
        Row(
          children: [
            keyboardButton('7'),
            keyboardButton('8'),
            keyboardButton('9'),
          ],
        ),
        Row(
          children: [
            keyboardButton(''),
            keyboardButton('0'),
            keyboardButton('⌫', onPressed: backspace),
          ],
        ),
      ],
    );
  }

  Widget keyboardButton(String text, {onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 80,
        width: 20,
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: TextButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: onPressed ?? () => input(text, widget.controller),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  void backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      _controller.text = value.substring(0, value.length - 1);
    }
  }
}
