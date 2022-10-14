import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/menu_screens/contactus_screens/email_view.dart';
import 'package:studio/widgets/custom_button.dart';

import '../../../utils/FCIStyle.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FCIColors.backColor(),
        elevation: 0,
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(40)),
          child: Builder(builder: (context) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contact Us",
                  style: FCITextStyle.bold(18, color: FCIColors.textColor()),
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.search_rounded,
                //     color: Colors.white,
                //     size: ScreenUtil().setSp(35),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            );
          }),
        ),
      ),
      backgroundColor: FCIColors.backColor(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setHeight(10)),
        child: Column(
          children: [
            Container(
              width: FCISize.width(context),
              height: ScreenUtil().setHeight(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageButton(
                    image: 'assets/images/tiktok.png',
                    onTap: () {},
                  ),
                  ImageButton(
                    image: 'assets/images/whatsapp.png',
                    onTap: () {},
                  ),
                  ImageButton(
                    image: 'assets/images/instagram.png',
                    onTap: () {},
                  ),
                  ImageButton(
                    image: 'assets/images/email.png',
                    onTap: () {
                      Get.to(() => ContactUsEmailView());
                    },
                  ),
                  ImageButton(
                    image: 'assets/images/snapchat.png',
                    onTap: () {},
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/Contact us-amic.png',
              width: FCISize.width(context) * 0.5,
              height: FCISize.height(context) * 0.5,
            )
          ],
        ),
      ),
    );
  }
}
