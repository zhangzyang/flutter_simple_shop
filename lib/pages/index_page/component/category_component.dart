import 'package:demo1/pages/index_page/model/category_model.dart';
import 'package:demo1/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MainCategory> categorys = Provider.of<IndexProvider>(context).mainCategorys;
    return Container(
      height: 100.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          MainCategory mainCategory = categorys[index];
          return _buildItemLayout(mainCategory, index);
        },
        itemCount: categorys.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildItemLayout(MainCategory mainCategory, int index) {
    return Container(
      margin: EdgeInsets.only(right: 50.w, left: index == 0 ? 25.w : 0),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Text(
        mainCategory.cname,
        style: TextStyle(fontSize: 55.sp, color: Colors.black),
      ),
    );
  }
}
