import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:studio/utils/FCIStyle.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const SettingButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          width: FCISize.width(context),
          padding: EdgeInsets.symmetric(
              horizontal: FCIPadding.textFieldPaddingHorizontal,
              vertical: FCIPadding.textFieldPaddingVertical),
          margin: EdgeInsets.symmetric(
              horizontal: FCIPadding.textFieldPaddingHorizontal,
              vertical: FCIPadding.textFieldPaddingVertical),
          decoration: BoxDecoration(
              color: FCIColors.accentColor(),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: FCIColors.blackaccenttColor())),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: FCITextStyle.normal(14, color: Colors.grey),
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: FCIColors.primaryColor()),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: ScreenUtil().setSp(20),
                  ))
            ],
          )),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final DateTime dateTime;
  const NotificationButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
          width: FCISize.width(context),
          padding: EdgeInsets.symmetric(
            horizontal: FCIPadding.textFieldPaddingHorizontal,
            // vertical:FCIPadding.textFieldPaddingVertical
          ),
          margin: EdgeInsets.symmetric(
              horizontal: FCIPadding.textFieldPaddingHorizontal,
              vertical: FCIPadding.textFieldPaddingVertical),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: FCITextStyle.normal(18, color: Colors.black),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: FCIColors.blackaccenttColor(),
                            size: ScreenUtil().setSp(20),
                          ),
                          Text(DateFormat('dd-MM-yyyy').format(dateTime),
                              style: FCITextStyle.normal(12,
                                  color: FCIColors.blackaccenttColor()))
                        ],
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(25),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: FCIColors.blackaccenttColor(),
                            size: ScreenUtil().setSp(20),
                          ),
                          Text(
                            DateFormat('kk:mm').format(dateTime),
                            style: FCITextStyle.normal(12,
                                color: FCIColors.blackaccenttColor()),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: FCIColors.iconColor(),
                size: ScreenUtil().setSp(20),
              )
            ],
          )),
    );
  }
}

class GreenButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Function onTap;
  const GreenButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: loading ? ScreenUtil().setWidth(40) : ScreenUtil().setWidth(200),
        height: ScreenUtil().setHeight(40),
        padding: EdgeInsets.symmetric(
            horizontal: FCIPadding.textFieldPaddingHorizontal,
            vertical: FCIPadding.textFieldPaddingVertical),
        margin: EdgeInsets.symmetric(
            horizontal: FCIPadding.textFieldPaddingHorizontal,
            vertical: FCIPadding.textFieldPaddingVertical),
        decoration: BoxDecoration(
          color: FCIColors.greenColor(),
          borderRadius: BorderRadius.circular(loading ? 100 : 5),
          // border: Border.all(
          //     color: FCIColors.buttonGreen()
          // )
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(30),
                    // height: ScreenUtil().setHeight(40),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: FCITextStyle.normal(20, color: Colors.white),
              ),
      ),
    );
  }
}

class NotificationsSettingButton extends StatelessWidget {
  final String text;
  final Function onChange;
  final bool value;
  const NotificationsSettingButton(
      {Key? key, required this.text, required this.onChange, this.value = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange;
      },
      child: Container(
          width: FCISize.width(context),
          padding: EdgeInsets.symmetric(
            horizontal: FCIPadding.textFieldPaddingHorizontal,
            // vertical:FCIPadding.textFieldPaddingVertical
          ),
          margin: EdgeInsets.symmetric(
              horizontal: FCIPadding.textFieldPaddingHorizontal,
              vertical: FCIPadding.textFieldPaddingVertical),
          decoration: BoxDecoration(
              color: FCIColors.accentColor(),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: FCIColors.blackaccenttColor())),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: FCITextStyle.normal(14, color: Colors.grey),
              ),
              Switch(
                  value: value,
                  activeColor: FCIColors.greenColor(),
                  inactiveTrackColor: FCIColors.blackaccenttColor(),
                  inactiveThumbColor: Colors.grey,
                  onChanged: (value) {})
            ],
          )),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String image;
  final Function onTap;
  const ImageButton({Key? key, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Image.asset(
          image,
          width: ScreenUtil().setWidth(35),
          height: ScreenUtil().setHeight(35),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: ScreenUtil().setHeight(180),
        padding: FCIPadding.symmetric(width: 5, height: 10),
        margin: FCIPadding.symmetric(height: 10),
        decoration: BoxDecoration(
            color: FCIColors.primaryColor(),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: FCIColors.blackaccenttColor())),
        alignment: Alignment.center,
        child: Text(
          text,
          style: FCITextStyle.normal(18, color: Colors.white),
        ),
      ),
    );
  }
}
