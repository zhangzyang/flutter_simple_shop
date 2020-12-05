import 'package:demo1/pages/index_page/model/category_model.dart';
import 'package:demo1/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item_layout.dart';

/// 通用分类插件
class CategoryComponent extends StatelessWidget {
  final List<InsetCustomItem> extendItems;
  final SelectWithItem onSelect;

  const CategoryComponent({Key key, this.extendItems, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MainCategory> categorys = Provider.of<IndexProvider>(context).mainCategorys;
    int extendItemsLength = extendItems == null ? 0 : extendItems.length;
    return Container(
      height: 100.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          InsetCustomItem insetCustomItem = _indexIsExtendWidget(index);
          if (insetCustomItem != null) {
            return GestureDetector(child: insetCustomItem.child, onTap: insetCustomItem.onTap);
          }else{
            MainCategory mainCategory = categorys[index-_getCountWhereInCategoryIndex(index)];
            return GestureDetector(
              child: CategoryItemDefaultLayout(name: mainCategory.cname, index: index),
              onTap: () {
                _onTap(mainCategory.cname, categorys);
              },
            );
          }
        },
        itemCount: categorys.length + extendItemsLength,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  /// 获取index前面有几个扩展的index
  int _getCountWhereInCategoryIndex(int index){
    int count = 0;
    if(extendItems!=null && extendItems.isNotEmpty){
      for(InsetCustomItem item in extendItems){
        if(item.index < index){
          count ++;
        }else{
          break;
        }
      }
    }
    return count;
  }

  /// 菜单被点击事件
  /// 不包含扩展项目
  void _onTap(String name, List<MainCategory> categorys) {
    int _index = -1;
    MainCategory _item;

    for (int i = 0; i < categorys.length; i++) {
      if (categorys[i].cname == name) {
        _index = i;
        _item = categorys[i];
        break;
      }
    }
    onSelect(_index, _item);
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
  /// 插入组件
  Widget child;

  /// 点击事件
  Function onTap;

  /// 插入位置
  int index;

  InsetCustomItem({this.index, this.onTap, this.child});
}

/// 菜单项被选择
/// [index] 选择的下标
/// [item] 选择的菜单信息
typedef SelectWithItem = void Function(int index, MainCategory item);
