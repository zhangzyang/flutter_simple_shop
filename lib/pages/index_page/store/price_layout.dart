import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 价钱布局
class PriceLayout extends StatelessWidget {

  final String original;// 原价
  final String discounts;// 优惠价
  const PriceLayout({Key key, this.original, this.discounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("¥ $original",style: TextStyle(fontSize: 60.sp,color: Colors.red)),
        SizedBox(width: 10.w),
        Text("¥$discounts",style: TextStyle(fontSize: 50.sp,color: Colors.grey,decoration: TextDecoration.lineThrough)),
      ],
    );
  }
}
