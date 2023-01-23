import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on((IncrementCounter event, emit) {
      if(state.counter<10){
        int counterValue=state.counter+1;
        emit(CounterSuccessState(counter: counterValue));
      }
      else{
        emit(CounterErrorState(counter: state.counter, errorMessage: "Counter value cannot exceed 10"));
      }
    });
    on((DecrementCounter event, emit) {
      if(state.counter>0){
        int counterValue=state.counter-1;
        emit(CounterSuccessState(counter: counterValue));
      }
      else{
        emit(CounterErrorState(counter: state.counter, errorMessage: "Counter value cannot be less than 0"));
      }

    });
  }
}
