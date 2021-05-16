import 'package:bee_pro/bloc/FormBloc.dart';
import 'package:bee_pro/locales/AppLocalization.dart';
import 'package:bee_pro/services/FeedBackService.dart';
import 'package:bee_pro/utils/constants.dart';
import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/TextFieldCustom.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final FormBloc form = FormBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: beelineColor,
            title: Text(AppLocalization.of(context).translate("ContactUs"),style: TextStyle(color: customBlack)),
        leading: IconButton(icon: Icon(Icons.close,color: customBlack),onPressed: () async {
          await popPage(context: context);
        })
        ),
        body: SingleChildScrollView(child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.8,
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: DropdownButtonFormField(
                elevation: 5,
                decoration: InputDecoration(
                  hintText: AppLocalization.of(context).translate("FeedType"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: beelineColor)
                  )
                ),
                onChanged: (val){
                  print(val);
                },
                items: [
                  const DropdownMenuItem(child: Text(""),value: ""),
                  DropdownMenuItem(value: "Taklif",child: Text(AppLocalization.of(context).translate("OfferType"))),
                  DropdownMenuItem(value: "Shikoyat",child: Text(AppLocalization.of(context).translate("CompType")))
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: TextFieldCustom(
                  controller: form.nameController,
                  label: AppLocalization.of(context).translate("FullName"),
              keyboardType: TextInputType.text
              )
            ),
            Expanded(
              flex: 1,
                child: TextFieldCustom(
                    controller: form.phoneController,
                    label: AppLocalization.of(context).translate("Phone"),
                    keyboardType: TextInputType.phone
                )
            ),
            Expanded(
              flex: 1,
                child: TextFieldCustom(
                    controller: form.emailController,
                    label: AppLocalization.of(context).translate("Email"),
                    keyboardType: TextInputType.emailAddress
                )
            ),
            Expanded(
              flex: 2,
                child: TextFieldCustom(
                    controller: form.commentController,
                    isMulti: true,
                    label: AppLocalization.of(context).translate("Comment"),
                    keyboardType: TextInputType.multiline
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  fillColor: beelineColor,
              child: Text(AppLocalization.of(context).translate("Send"),style: TextStyle(color: customBlack)),
              onPressed: () async {
                    if(form.nameController.text.isNotEmpty && form.phoneController.text.isNotEmpty && form.phoneController.text.isNotEmpty && form.commentController.text.isNotEmpty) {
                      final String feedBack = """FeedBackType: Taklif\nFullName: ${form.nameController.text}\nPhone: ${form.phoneController.text}\nEmail: ${form.emailController.text}\nComment: ${form.commentController.text}""";
                      FeedBackService feed = FeedBackService();
                      await feed.init(feedBack);
                      popPage(context: context);
                    }
              },
             constraints: BoxConstraints(minWidth: double.infinity,minHeight: 40.0,maxHeight: 40.0),
            ))
          ]
        )
        ))
        )
    );
  }
}