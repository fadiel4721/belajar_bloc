import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bilangan_primer_state.dart';

class BilanganPrimerCubit extends Cubit<bool> {
  BilanganPrimerCubit() : super(false);

  void hitungBilanganPrima(int inputValue) {
    bool isPrime = true;

    if (inputValue <= 1) {
      isPrime = false;
    } else {
      for (int i = 2; i <= inputValue ~/ 2; i++) {
        if (inputValue % i == 0) {
          isPrime = false;
        }
      }
    }
    emit(isPrime);
    print(isPrime);
  }
}
