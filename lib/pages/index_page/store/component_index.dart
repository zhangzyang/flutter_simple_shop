import 'package:demo1/pages/index_page/model/store_list_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo1/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 首页推荐商店模块
class StoreComponentIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreData storeData = Provider.of<IndexProvider>(context).storeData;
    return storeData != null
        ? Container(
            child: Column(
              children: [_buildTitle(context)],
            ),
          )
        : Container();
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Flex(direction: Axis.horizontal, children: [
        Flexible(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("品牌特卖", style: Theme.of(context).textTheme.headline6),
            Text("今日上新774款", style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)),
          ],
        )),
        Flexible(child: Container(child: Text("特步5折特卖"),alignment: Alignment.centerRight)),
      ]),
    );
  }
}
