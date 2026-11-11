import 'package:flutter/material.dart';
 
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
 
  @override
  State<CalculatorScreen> createState() =>
      _CalculatorScreenState();
}
 
class _CalculatorScreenState extends State<CalculatorScreen> {
  
  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();
 
  String result = '0';
  String operationLabel = 'Enter two numbers';

  void calculate(String operation) {

  final first =
      double.tryParse(firstNumberController.text.trim());
 
  final second =
      double.tryParse(secondNumberController.text.trim());
 
 
  if (first == null ||
      second == null ||
      !first.isFinite ||
      !second.isFinite) {
    setState(() {
      result = 'Invalid input';
      operationLabel = 'Please enter two valid numbers';
    });
    return;
  }
 
  if (operation == '÷' && second == 0) {
    setState(() {
      result = 'Cannot divide by zero';
      operationLabel = 'Please change the second number';
    });
    return;
  }
 
  double answer;
 
  switch (operation) {
    case '+':
      answer = first + second;
      break;
    case '-':
      answer = first - second;
      break;
    case '×':
      answer = first * second;
      break;
    case '÷':
      answer = first / second;
      break;
    default:
      return;
  }
 
  setState(() {
    result = answer.toString();
    operationLabel = '$first $operation $second';
  });
}
void clearCalculator() {
  firstNumberController.clear();
  secondNumberController.clear();
 
  setState(() {
    result = '0';
    operationLabel = 'Enter two numbers';
  });
}
@override
void dispose() {
  firstNumberController.dispose();
  secondNumberController.dispose();
  super.dispose();
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('My Stateful Calculator'),
      centerTitle: true,
      backgroundColor: Color(0xFF0D1B1E),
      foregroundColor: Color(0xFFE8DCB9),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.calculate,
            size: 64,
            color: Color(0xFFE8DCB9),
          ),
          const SizedBox(height: 12),
 
          const Text(
            'BASIC CALCULATOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
 
          TextField(
            controller: firstNumberController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: const InputDecoration(
              labelText: 'First Number',
              hintText: 'Enter the first number',
              prefixIcon: Icon(Icons.looks_one),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
 
          TextField(
            controller: secondNumberController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Second Number',
              hintText: 'Enter the second number',
              prefixIcon: Icon(Icons.looks_two),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
 
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => calculate('+'),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('-'),
                child: const Text(
                  '−',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('×'),
                child: const Text(
                  '×',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('÷'),
                child: const Text(
                  '÷',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
 
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFF7798AB),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF0D1B1E)),
            ),
            child: Column(
              children: [
                Text(
                  operationLabel,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'RESULT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D1B1E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
 
          OutlinedButton.icon(
            onPressed: clearCalculator,
            icon: const Icon(Icons.refresh),
            label: const Text('Clear'),
            
          ),
          const SizedBox(height: 24),
 
          const Text(
            'Created by: Jhon Christopher Damasco\nSection: CCE106L(3447)',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
}