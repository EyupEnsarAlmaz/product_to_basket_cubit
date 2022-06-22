import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void arttir() => emit(state + 1);
  void azalt() => emit(state - 1);
}
