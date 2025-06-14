import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../models/history_model.dart';
import '../widget/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key}); // Gunakan super parameter

  @override
  State<CalculatorScreen> createState() => CalculatorScreenState(); // Buat public
}

class CalculatorScreenState extends State<CalculatorScreen> { // Ubah nama agar public
  String userInput = '';
  String result = '0';

  void onButtonPressed(String btnTxt) {
    setState(() {
      if (btnTxt == 'AC') {
        userInput = '';
        result = '0';
      } else if (btnTxt == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(userInput.replaceAll('x', '*'));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
          HistoryModel.historyList.add('$userInput = $result');
        } catch (e) {
          result = 'Error';
        }
      } else if (btnTxt == '⌫') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else {
        userInput += btnTxt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userInput, style: const TextStyle(fontSize: 32)),
              Text(result, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Flexible(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: const EdgeInsets.all(10),
                  children: [
                    '7', '8', '9', '/',
                    '4', '5', '6', 'x',
                    '1', '2', '3', '-',
                    'AC', '0', '=', '+',
                    '⌫'
                  ].map((text) => CalculatorButton(
                        key: ValueKey(text), // Pastikan tiap tombol unik
                        text: text,
                        onPressed: onButtonPressed,
                      )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
