// device_state.dart
class DeviceState {
  final bool isSwitchedOn;

  DeviceState({required this.isSwitchedOn});

  DeviceState copyWith({bool? isSwitchedOn}) {
    return DeviceState(
      isSwitchedOn: isSwitchedOn ?? this.isSwitchedOn,
    );
  }
}
