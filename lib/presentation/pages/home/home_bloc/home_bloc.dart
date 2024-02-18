import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/presentation/pages/home/home_bloc/home_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const InitialNotificationState());
}
