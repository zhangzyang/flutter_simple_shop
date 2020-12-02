import 'package:demo1/modals/params_model/store_params_model.dart';
import 'package:demo1/pages/index_page/model/category_model.dart';
import 'package:demo1/pages/index_page/model/topic_model.dart';
import 'package:demo1/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

/// 首页状态管理
class IndexProvider with ChangeNotifier {
  Color topBackground = Colors.pinkAccent;
  List<MainCategory> mainCategorys = []; // 超级分类数据
  List<MainTopic> mainTopic = []; // 轮播

  /// 加载超级分类菜单
  Future<void> fetchCategorys() async {
    List<MainCategory> list = await IndexService.fetchCategory();
    this.mainCategorys = list;
    notifyListeners();
  }

  /// 获取精选专辑列表
  Future<void> fetchTopics() async {
    List<MainTopic> list = await IndexService.fetchTopics();
    this.mainTopic = list;
    notifyListeners();
  }

  /// 获取品牌栏目列表
  Future<void> fetchStores() async {
    await IndexService.fetchStores(StoreListParamsModel(mainCategorys[0].cid.toString(), "1", "10"));
  }

  /// 改变顶部背景颜色
  Future<void> changeToColor(String netImageUrl) async {
    PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(netImageUrl),
      maximumColorCount: 20,
    );
    this.topBackground = paletteGenerator.dominantColor.color;
    notifyListeners();
  }
}
