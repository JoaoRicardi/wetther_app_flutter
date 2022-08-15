import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {

  final String message;

  const CustomDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red,size: 44,),
              const SizedBox(height: 22,),
              Text(message)
            ],
          ),
        ),
      ),
    );
  }
}
