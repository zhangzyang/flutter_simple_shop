import 'package:demo1/util/navigator_util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as Sc;
import 'package:fsuper/fsuper.dart';

import '../widgets/coupon_price.dart';
import 'extended_image.dart';

// 瀑布流商品卡片
class WaterfallGoodsCard extends StatelessWidget {
  final dynamic datum;

  WaterfallGoodsCard(this.datum);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          NavigatorUtil.instance.toProductDetail(datum.id.toString());
        },
        child: Container(
            //width: Sc.ScreenUtil().setWidth(640), // (1440-150) / 2
            padding: EdgeInsets.only(bottom: Sc.ScreenUtil().setHeight(50)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: <Widget>[
                _image(),

                SizedBox(height: Sc.ScreenUtil().setHeight(20)),

                // 标题
                _title(datum.dtitle),

                SizedBox(height: Sc.ScreenUtil().setHeight(20)),
                // 购买理由
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Sc.ScreenUtil().setWidth(40)),
                  child: Text(
                    datum.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: Sc.ScreenUtil().setSp(45)),
                  ),
                ),

                SizedBox(height: Sc.ScreenUtil().setHeight(20)),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Sc.ScreenUtil().setWidth(40)),
                  child: FSuper(
                    text: '领 ${NumUtil.getNumByValueDouble(datum.couponPrice, 0)} 元券',
                    textSize: Sc.ScreenUtil().setSp(45),
                    padding: EdgeInsets.symmetric(horizontal: Sc.ScreenUtil().setWidth(40)),
                    textColor: Colors.pink,
                    corner: Corner.all(16),
                    strokeColor: Colors.pink,
                    strokeWidth: 0.3,
                  ),
                ),

                SizedBox(height: Sc.ScreenUtil().setHeight(20)),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: Sc.ScreenUtil().setWidth(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      CouponPriceWidget(
                          actualPrice: datum.actualPrice.toString(),
                          originalPrice: datum.originalPrice),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _title(String dtitle) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Sc.ScreenUtil().setWidth(40)),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                dtitle,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: Sc.ScreenUtil().setSp(45)),
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ));
  }

  // 商品卡片主图
  Widget _image() {
    String img = datum.mainPic;
    return ExtendedImageWidget(
      src: img,
      height: 645,
      width: 645,
      knowSize: false,
      radius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
    );
  }
}
