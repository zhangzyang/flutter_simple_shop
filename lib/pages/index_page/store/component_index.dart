import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

/// 首页推荐商店模块
class StoreComponentIndex extends StatefulWidget {
  @override
  _StoreComponentIndexState createState() => _StoreComponentIndexState();
}

class _StoreComponentIndexState extends State<StoreComponentIndex> with AfterLayoutMixin<StoreComponentIndex>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("店铺列表"),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
  }
}
