import 'package:bloc_pattern/counter_bloc/counter_bloc.dart';
import 'package:bloc_pattern/counter_bloc/counter_event.dart';
import 'package:bloc_pattern/counter_bloc/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: Scaffold(
        body: BlocBuilder<CounterBloc, int>(
          builder: (ctx, state) {
            return Column(
              children: [
                Text(state.toString()),
                _button(() => _increase(ctx), "Increase"),
                _button(() => _decrease(ctx), "Decrease"),
              ],
            );
          },
        ),
      ),
    );
  }

  _increase(BuildContext context) {
    context.read<CounterBloc>().add(IncreaseEvent());
  }

  _decrease(BuildContext context) {
    context.read<CounterBloc>().add(DecreaseEvent());
  }

  _button(Function() onTap, String label) {
    return ElevatedButton(onPressed: onTap, child: Text(label));
  }
}
