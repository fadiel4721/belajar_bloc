// device_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'device_event.dart';
import 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceState(isSwitchedOn: false)) {
   
    on<ToggleSwitchEvent>((event, emit) {
     
      print('Switch state: ${event.isSwitchedOn}');
      emit(state.copyWith(isSwitchedOn: event.isSwitchedOn));
    });
  }
}
