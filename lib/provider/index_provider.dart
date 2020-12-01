import 'package:demo1/pages/index_page/model/category_model.dart';
import 'package:demo1/pages/index_page/model/topic_model.dart';
import 'package:demo1/service/index_service.dart';
import 'package:flutter/material.dart';

/// 首页状态管理
class IndexProvider with ChangeNotifier {
  Color topBackground = Colors.red;
  List<MainCategory> mainCategorys = []; // 超级分类数据
  List<MainTopic> mainTopic = [];// 轮播

  /// 加载超级分类菜单
  Future<void> fetchCategorys() async {
    List<MainCategory> list = await IndexService.fetchCategory();
    this.mainCategorys = list;
    notifyListeners();
  }

  /// 获取精选专辑列表
  Future<void> fetchTopics()async{
    List<MainTopic> list = await IndexService.fetchTopics();
    this.mainTopic = list;
    for(MainTopic mainTopic in list){
      print(mainTopic.topicName);
      print(mainTopic.banner);
    }
    notifyListeners();
  }
}
