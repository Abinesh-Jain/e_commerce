import '../models/marketplace_request.dart';
import '../services/dio_service.dart';
import '../utils/endpoints.dart';

class MarketplaceApi {
  final dio = DioService();

  Future<List<MarketplaceRequest>> getMarketplaceRequests({
    int page = 1,
  }) async {
    try {
      final response = await dio.get(Endpoints.marketplace, queryParameters: {
        'page': page,
      });
      final List data = response['marketplace_requests'] ?? [];
      return data.map((e) => MarketplaceRequest.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<MarketplaceRequest?> getMarketplaceRequest(String idHash) async {
    try {
      final response = await dio.get(Endpoints.marketplace, queryParameters: {
        'id_hash': idHash,
      });
      final data = response['web_marketplace_requests'];
      return MarketplaceRequest.fromJson(data);
    } catch (e) {
      return null;
    }
  }
}
