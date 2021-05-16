import 'package:bee_pro/utils/helperFunctions.dart';
import 'package:bee_pro/widgets/ContentDialog.dart';
import 'package:flutter/material.dart';

class ItemCardPreview extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String activationCode;
  const ItemCardPreview({Key key,this.index,this.title, this.description, this.activationCode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 120.0,
        child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: InkWell(
                    onTap: () async {
                      await dialogModal(
                          title: title,
                          context: context, content: [
                        ContentDialog(description: description,activationCode: activationCode)]
                        );
                      },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Align(child: Text(title),alignment: Alignment.centerLeft)
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Align(child: Text(activationCode),alignment: Alignment.centerLeft)
                      )
                    ])
    ))
    );
  }
}
