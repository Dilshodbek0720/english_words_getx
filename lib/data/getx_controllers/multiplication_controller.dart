import 'package:rxdart/rxdart.dart';

class MultiplicationController {
  final _firstNumberStream = BehaviorSubject<int>();
  final _secondNumberStream = BehaviorSubject<int>();

  Stream<int> get firstNumberStream => _firstNumberStream.stream;
  Stream<int> get secondNumberStream => _secondNumberStream.stream;

  Stream<int> get multiplicationStream =>
      Rx.combineLatest2(firstNumberStream, secondNumberStream, (a, b) => a * b);

  void updateFirstNumber(int number) {
    _firstNumberStream.sink.add(number);
  }

  void updateSecondNumber(int number) {
    _secondNumberStream.sink.add(number);
  }

  void dispose() {
    _firstNumberStream.close();
    _secondNumberStream.close();
  }
}
