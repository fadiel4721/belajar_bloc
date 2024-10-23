import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ganjil_genap_state.dart';

class GanjilGenapCubit extends Cubit<int> {
  GanjilGenapCubit() : super(0);

  // void hitungGanjilGenap() {

  //   emit(state % 2 == 0 ? state + 1 : state + 2);
  // }
  void hitungGanjilGenap(int i) {
    emit((state + i) % 2);
  }
}
