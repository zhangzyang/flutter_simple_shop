import 'package:after_layout/after_layout.dart';
import 'package:demo1/pages/brand_page/provider/brand_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

/// 品牌详情页面
class BrandDetailView extends StatefulWidget {

  final String brandId;// 品牌id

  const BrandDetailView({Key key, this.brandId}) : super(key: key);

  @override
  _BrandDetailViewState createState() => _BrandDetailViewState();
}

class _BrandDetailViewState extends State<BrandDetailView> with AfterLayoutMixin<BrandDetailView>{

  BrandProvider _brandProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(this._brandProvider==null)this._brandProvider = Provider.of<BrandProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("品牌详情")),
      body: EasyRefresh.custom(slivers: [

      ]),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await _brandProvider.detail(widget.brandId);
  }
}
