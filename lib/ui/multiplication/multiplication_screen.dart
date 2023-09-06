import 'package:english_words/ui/widgets/global_text_fields.dart';
import 'package:flutter/material.dart';
import '../../data/getx_controllers/multiplication_controller.dart';

class MultiplicationScreen extends StatefulWidget {
  const MultiplicationScreen({super.key});

  @override
  State<MultiplicationScreen> createState() => _MultiplicationScreenState();
}

class _MultiplicationScreenState extends State<MultiplicationScreen> {
  final MultiplicationController multiplicationController =
      MultiplicationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiplication Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60,),
            const Text('Enter first number:', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),),
            const SizedBox(height: 30,),
            GlobalTextField(hintText: "Enter first number", keyboardType: TextInputType.number, textInputAction: TextInputAction.done, textAlign: TextAlign.start, onChanged: (number1){
              multiplicationController
                  .updateFirstNumber(int.tryParse(number1) ?? 0);
            }),
            const SizedBox(height: 20),
            const Text('Enter second number:', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),),
            const SizedBox(height: 30,),
            GlobalTextField(hintText: "Enter second number", keyboardType: TextInputType.number, textInputAction: TextInputAction.done, textAlign: TextAlign.start, onChanged: (number2){
              multiplicationController
                  .updateSecondNumber(int.tryParse(number2) ?? 0);
            }),
            const SizedBox(height: 20),
            StreamBuilder<int>(
              stream: multiplicationController.multiplicationStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Multiplication:\n ${snapshot.data}',
                    style: const TextStyle(
                    fontSize: 23,
                  ),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Text('Multiplication: -');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    multiplicationController.dispose();
    super.dispose();
  }
}
