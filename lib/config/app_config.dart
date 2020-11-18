import 'package:demo1/pages/index_page/model/index_grid_menu_item_model.dart';

class AppConfig {}

/// 2020年11月17日 23:20:10
/// 首页的网格菜单
/// !!静态数据!!
/// v2.0
final List<IndexGridMenuItemModel> indexGridMenus = [
  IndexGridMenuItemModel(
      "疯抢排行",
      "https://img.alicdn.com/imgextra/i2/2053469401/O1CN01cd4Sbe2JJi0BtsCQ9_!!2053469401.png",
      IndexGridMenuItemModelClickModel.BROWSER,
      getToBrowserParams("http://itbug.shop/index.php?r=activity/sc#/fengqianglist")),
  IndexGridMenuItemModel(
      "9.9包邮",
      "https://img.alicdn.com/imgextra/i4/2053469401/O1CN01yAF5em2JJi03dO5Rt_!!2053469401.png",
      IndexGridMenuItemModelClickModel.BROWSER,
      getToBrowserParams("http://itbug.shop/index.php?r=activity/sc#/fengqianglist")),
  IndexGridMenuItemModel(
      "品牌特卖",
      "https://img.alicdn.com/imgextra/i4/2053469401/O1CN01Kl54Hm2JJi0M4oJzL_!!2053469401.png",
      IndexGridMenuItemModelClickModel.BROWSER,
      getToBrowserParams("http://itbug.shop/index.php?r=activity/sc#/fengqianglist")),
  IndexGridMenuItemModel(
      "每日半价",
      "https://img.alicdn.com/imgextra/i4/2053469401/O1CN01VHkeLW2JJi03dNHba_!!2053469401.png",
      IndexGridMenuItemModelClickModel.BROWSER,
      getToBrowserParams("http://itbug.shop/index.php?r=activity/sc#/fengqianglist")),
  IndexGridMenuItemModel(
      "折上折",
      "https://img.alicdn.com/imgextra/i2/2053469401/O1CN01cUcsnS2JJi03dPxrH_!!2053469401.png",
      IndexGridMenuItemModelClickModel.BROWSER,
      getToBrowserParams("http://itbug.shop/index.php?r=activity/sc#/fengqianglist")),
];





// 跳转到外部浏览器的参数
Map<String, String> getToBrowserParams(String url){
  Map<String, String> map = Map<String,String>();
  map["url"] = "$url";// 跳转url
  return map;
}