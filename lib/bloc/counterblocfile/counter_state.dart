part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterSuccessState extends CounterState{
  const CounterSuccessState({int counter}) : super(counter);
}
class CounterErrorState extends CounterState{
  final String errorMessage;
  CounterErrorState({int counter, this.errorMessage}) : super(counter);
}

class CounterInitial extends CounterState {
  const CounterInitial(int counter) : super(counter);
}
