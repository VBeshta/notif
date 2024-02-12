import 'package:notif/data/models/notification_model.dart';

sealed class NotificationEvent {
  const NotificationEvent();
}

final class AddNotification extends NotificationEvent {}

final class EditNotification extends NotificationEvent {
  const EditNotification(this.notification);

  final NotificationModel notification;
}

final class RemoveNotification extends NotificationEvent {
  const RemoveNotification(this.notificationId);

  final String notificationId;
}

final class SelectNotificationTrigger extends NotificationEvent {
  const SelectNotificationTrigger(this.showOnTime);
  final bool showOnTime;
}
