import 'package:notif/data/data_source/network_data_source/auth_network_data_source.dart';
import 'package:notif/data/service/network_service/network_service.dart';

class WorkoutAuthNetworkDataSource implements AuthNetworkDataSource {
  WorkoutAuthNetworkDataSource({
    required this.networkService,
  });

  final NetworkService networkService;
}
