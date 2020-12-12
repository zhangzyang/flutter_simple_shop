import 'package:demo1/pages/detail_page/hdk/index_home.dart';
import 'package:nav_router/nav_router.dart';

/// 路由工具类
class NavigatorUtil {
  NavigatorUtil._();

  static NavigatorUtil _instance = NavigatorUtil._();

  factory NavigatorUtil() => _instance;

  static NavigatorUtil get instance => _instance;

  /// 跳转商品详情页面
  void toProductDetail(String productId) {
    routePush(HaoDanKuDetailItem(productId: productId));
  }
}
