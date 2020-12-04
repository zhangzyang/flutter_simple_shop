import 'package:demo1/pages/index_page/model/category_model.dart';
import 'package:demo1/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item_layout.dart';

/// 通用分类插件
class CategoryComponent extends StatelessWidget {
  final List<InsetCustomItem> extendItems;

  const CategoryComponent({Key key, this.extendItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MainCategory> categorys = Provider.of<IndexProvider>(context).mainCategorys;
    int extendLength = 0;
    if (extendItems != null) extendLength = extendItems.length;
    return Container(
      height: 100.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          InsetCustomItem insetCustomItem = _indexIsExtendWidget(index);
          if (insetCustomItem != null) {
            return insetCustomItem.child;
          }
          MainCategory mainCategory = categorys[index];
          return CategoryItemDefaultLayout(name:mainCategory.cname, index: index);
        },
        itemCount: categorys.length + extendLength,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  /// 判断下标是否需要插入自定义布局
  InsetCustomItem _indexIsExtendWidget(int index) {
    InsetCustomItem insetCustomItem;
    if (extendItems != null) {
      for (int i = 0; i < extendItems.length; i++) {
        if (index == extendItems[i].index) {
          insetCustomItem = extendItems[i];
          break;
        }
      }
    }
    return insetCustomItem;
  }
}

class InsetCustomItem {
  Widget child;
  Function onTap;
  int index;

  InsetCustomItem({this.index, this.onTap, this.child});
}
