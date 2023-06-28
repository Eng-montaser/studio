 import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../utils/FCIStyle.dart';
import 'clippath.dart';

class PageLoading extends StatelessWidget {
  final Widget child;
  final bool loading;
  // final bool show;
  const PageLoading({
    Key? key,
    required this.child,
    required this.loading,
    // this.show = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Stack(
      alignment: Alignment.center,
      children: [
        child,
        if(loading)
        Container(
          width: FCISize.width(context),
          height: FCISize.height(context),
          color: Colors.white.withOpacity(0.3),
          child:   Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: FCIColors.primaryColor())
                ),
                height: 100,width: 100,
              ),
              WidgetAnimator(
                atRestEffect:WidgetRestingEffects.size(),
                child:Image.asset( "assets/images/sward.jpg",height: 35,width: 35,),
              ),
              Image.asset( "assets/images/loading.gif",height: 100,width: 100,)
            ],
          ),
        )
      ],
    );
  }
}
