import 'package:demo1/modals/params_model/store_params_model.dart';
import 'package:demo1/pages/index_page/model/store_list_model.dart';
import 'package:demo1/service/app_service.dart';
import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier {
  int page = 1;
  int size = 10;
  String cid = "";
  List<StoreInfo> lists = [];

  void setCid(String _cid) => this.cid = _cid;

  /// 加载品牌列表
  Future<void> refresh() async {
    lists.clear();
    page = 1;
    StoreListParamsModel storeListParamsModel = StoreListParamsModel(this.cid, "${this.page}", "${this.size}");
    StoreData storeData = await IndexService.fetchStores(storeListParamsModel);
    if (storeData != null) {
      this.lists.addAll(storeData.lists);
    }
    notifyListeners();
  }
}
