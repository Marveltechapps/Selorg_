class NotificationState {
  final bool isOn;

  NotificationState({required this.isOn});

  NotificationState copyWith({bool? isOn}) {
    return NotificationState(isOn: isOn ?? this.isOn);
  }
}
