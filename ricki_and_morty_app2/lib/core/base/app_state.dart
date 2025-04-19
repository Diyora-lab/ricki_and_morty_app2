import 'package:ricki_and_morty_app2/core/enum/state_status.dart';

class AppState<T> {
  final StateStatus status;
  final T? model;

  AppState({
    required this.status,
    this.model,
  });
  AppState.success(
    this.model,
  ) : status = StateStatus.succes;
}
