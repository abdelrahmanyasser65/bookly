import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key,
    required this.imageUrl}) : super(key: key);
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5/4,
        child: CachedNetworkImage(
          imageUrl:imageUrl,
          fit: BoxFit.fill,
          errorWidget:(context,url,error)=>Container(
            color: Colors.grey.withOpacity(0.3),
            child: Icon(Icons.error,size: 6.h,),
          ),
        ),
      ),
    );
  }
}
