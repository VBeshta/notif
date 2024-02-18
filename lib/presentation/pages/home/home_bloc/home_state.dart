import 'package:equatable/equatable.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class InitialNotificationState extends NotificationState {
  const InitialNotificationState();
}
