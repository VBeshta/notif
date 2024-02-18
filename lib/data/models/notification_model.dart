class NotificationModel {
  const NotificationModel({
    required this.id,
    required this.time,
    required this.isOneTime,
    required this.message,
    this.icon,
    this.backgroundColor,
  });

  final String id;
  final String time;
  final bool isOneTime;
  final String message;
  final String? icon;
  final String? backgroundColor;
}
