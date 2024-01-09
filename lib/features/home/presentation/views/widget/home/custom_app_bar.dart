import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/resources/app_router.dart';
import 'package:abookly/core/resources/images.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 3.h,
        top: 6.h,
        bottom: 3.h
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.logo,
          height: 3.h,

          ),
        const   Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.rSearch);
          },

              icon:const  Icon(
                  FontAwesomeIcons.magnifyingGlass,
              size: 22,
              ))
        ],
      ),
    );
  }
}
