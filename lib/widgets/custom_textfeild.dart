import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studio/utils/FCIStyle.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  IconData? icon;
  final bool obsecure;
  final bool enabled;
  final Widget? suffixicon;
  final TextEditingController? controller;
  final String? initial;
  final int minLines; //Normal textInputField will be displayed
  final int maxLines;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validate;
  final TextInputType inputType;
  final double width;
  final double height;
  final Function onTap;
  final Function onEditingComplete;
  CustomTextField(
      {Key? key,
        this.hintText = '',
        this.icon = null,
        this.validate = null,
        this.suffixicon = null,
        this.obsecure = false,
        this.enabled = true,
        this.onChanged,
        this.inputType = TextInputType.text,
        this.initial = null,
        this.focusNode,
        this.controller,
        this.minLines = 1,
        this.maxLines = 1,
        this.width = 0,
        this.height = 0,
        required this.onTap,
        required this.onEditingComplete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? FCISize.width(context) : width,
      height:height == 0 ?  ScreenUtil().setHeight(60) : height,
      padding: FCIPadding.symmetric(
        height: 5,width: 10
      ),
      margin:  FCIPadding.symmetric(
          height: 10,width: 30
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        onTap: () {
          onTap();
        },
        onEditingComplete: () {
          onEditingComplete();
        },
        enabled: enabled,
        enableInteractiveSelection: true,
        controller: controller,
        keyboardType: inputType,
        validator: validate,
        initialValue: initial,
        obscureText: obsecure,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        decoration:   InputDecoration(
          hintText: hintText,
          hintStyle: FCITextStyle.normal(16, color: FCIColors.textColor()),
          labelStyle: FCITextStyle.normal(14, color: Colors.grey),
          labelText: hintText,
          border: InputBorder.none,
        ),

        // onChanged: onSearchTextChanged,
      ),
    );
  }
}
class CustomTextField2 extends StatelessWidget {
  final String hintText;
  IconData? icon;
  final bool obsecure;
  final bool enabled;
  final Widget? suffixicon;
  final TextEditingController? controller;
  final String? initial;
  final int minLines; //Normal textInputField will be displayed
  final int maxLines;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validate;
  final TextInputType inputType;
  final double width;
  final double height;
  final Function onTap;
  final Function onEditingComplete;
  CustomTextField2(
      {Key? key,
        this.hintText = '',
        this.icon = null,
        this.validate = null,
        this.suffixicon = null,
        this.obsecure = false,
        this.enabled = true,
        this.onChanged,
        this.inputType = TextInputType.text,
        this.initial = null,
        this.focusNode,
        this.controller,
        this.minLines = 1,
        this.maxLines = 1,
        this.width = 0,
        this.height = 0,
        required this.onTap,
        required this.onEditingComplete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? FCISize.width(context) : width,
      height:height == 0 ?  ScreenUtil().setHeight(60) : height,
      padding: FCIPadding.symmetric(
          height: 5,width: 10
      ),
      // margin:  FCIPadding.symmetric(
      //     height: 10,width: 30
      // ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        onTap: () {
          onTap();
        },
        onEditingComplete: () {
          onEditingComplete();
        },
        enabled: enabled,
        enableInteractiveSelection: true,
        controller: controller,
        keyboardType: inputType,
        validator: validate,
        initialValue: initial,
        obscureText: obsecure,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        decoration:   InputDecoration(
          hintText: hintText,
          hintStyle: FCITextStyle.normal(16, color: FCIColors.textColor()),
          labelStyle: FCITextStyle.normal(14, color: Colors.grey),
          // labelText: hintText,
          border: InputBorder.none,
        ),

        // onChanged: onSearchTextChanged,
      ),
    );
  }
}