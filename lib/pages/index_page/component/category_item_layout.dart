import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemDefaultLayout extends StatelessWidget {

  final int index;
  final String name;

  const CategoryItemDefaultLayout({Key key, this.index, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 50.w, left: index == 0 ? 25.w : 0),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Text(
        name,
        style: TextStyle(fontSize: 55.sp, color: Color.fromRGBO(255, 255, 255, .65)),
      ),
    );
  }
}
