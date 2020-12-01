import 'package:demo1/network/apis.dart';
import 'package:demo1/network/http_request.dart';

class StoreService {
  /// 获取店铺列表
  static Future<void> fetchStoreList() async {
    String response =await HttpRequest.req(Apis.BRAND_LIST);
    print("商店列表:$response");
  }
}
