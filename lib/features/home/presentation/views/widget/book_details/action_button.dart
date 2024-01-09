import 'package:flutter/material.dart';
import 'package:abookly/core/resources/colors.dart';
import 'package:abookly/core/resources/funcions/launch_url.dart';
import 'package:abookly/core/widget/custom_buttion.dart';
import 'package:abookly/features/home/data/models/book_models/Books_model.dart';
import 'package:url_launcher/url_launcher.dart';
class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.booksModel}) : super(key: key);
   final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
              text: "free ",
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft:Radius.circular(16),
              ),
              textColor: ColorManager.black,
              backgroundColor: ColorManager.white,
            onPressed: () {  },),
        ),
        Expanded(
          child: CustomButton(
              onPressed: (){
                launchCustomUrl(context, booksModel.volumeInfo!.previewLink!);
              },
              text: getText(booksModel),
              borderRadius:const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight:Radius.circular(16),
              ),
              textColor: ColorManager.white,
              backgroundColor: ColorManager.buttonColor),
        ),
      ],
    );
  }

  getText(BooksModel booksModel) {
    if(booksModel.volumeInfo!.previewLink==null){
      return "Not Avaliable";
    }else{
      return "preview";
    }
  }
}
