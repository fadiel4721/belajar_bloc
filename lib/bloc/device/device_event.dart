
import 'package:equatable/equatable.dart';


abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}


class ToggleSwitchEvent extends DeviceEvent {
  final bool isSwitchedOn;

  const ToggleSwitchEvent(this.isSwitchedOn);

  @override
  List<Object> get props => [isSwitchedOn];
}
