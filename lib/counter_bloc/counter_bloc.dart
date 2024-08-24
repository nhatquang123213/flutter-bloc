import 'package:bloc_pattern/counter_bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncreaseEvent>((event, emit) => _increase(emit));
    on<DecreaseEvent>((event, emit) => _decrease(emit));
  }

  _increase(Emitter emitter) {
    emitter(state + 1);
  }

  _decrease(Emitter emitter) {
    emitter(state - 1);
  }
}
