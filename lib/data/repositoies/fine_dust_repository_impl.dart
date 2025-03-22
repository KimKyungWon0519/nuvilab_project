import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';

class FineDustRepositoryImpl implements FineDustRepository {
  late final FineDustApiClient _fineDustApiClient;

  FineDustRepositoryImpl({
    required FineDustApiClient fineDustApiClient,
  }) : _fineDustApiClient = fineDustApiClient;
}
