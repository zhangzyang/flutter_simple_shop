import 'package:demo1/modals/params_model/store_detail_params_model.dart';
import 'package:demo1/modals/params_model/store_params_model.dart';
import 'package:demo1/pages/brand_page/models/brand_detail_model.dart';
import 'package:demo1/pages/index_page/model/store_list_model.dart';
import 'package:demo1/service/app_service.dart';
import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier {
  int page = 1;
  int size = 10;
  String cid = "";
  List<StoreInfo> lists = [];
  String brandId = "";
  int pageId =  1;
  int pageSize = 20;
  List<BrandDetailGoodsList> brandGoodsList = [];
  BrandDetailModel brandDetail;

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

  /// 加载下一页
  Future<void> load() async {
    this.page = this.page + 1;
    print("正在加载下一页:$page");
    StoreListParamsModel storeListParamsModel = StoreListParamsModel(this.cid, "${this.page}", "${this.size}");
    StoreData storeData = await IndexService.fetchStores(storeListParamsModel);
    if (storeData != null) {
      this.lists.addAll(storeData.lists);
    }
    notifyListeners();
  }

  /// 加载品牌页面
  /// 首次
  Future<void> detail(String _brandId) async {
    this.brandId = _brandId;

    StoreDetailParamsModel storeDetailParamsModel = StoreDetailParamsModel(_brandId, "$pageSize", "$pageId");
    BrandDetailModel brandDetailModel = await IndexService.fetchStoreDetail(storeDetailParamsModel);
    if (brandDetailModel != null) {
      this.brandGoodsList.addAll(brandDetailModel.list);
      this.brandDetail = brandDetailModel;
      notifyListeners();
    }
  }
}
