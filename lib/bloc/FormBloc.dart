import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc {
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController commentController;

  Future<void> init() async {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    commentController = TextEditingController();
  }

  FormBloc() { init(); }


  Future<String> getText({@required TextEditingController controller}) async {
    if(controller.text.isNotEmpty){
      return controller.text.toString();
    }
  }
  void clearText({@required TextEditingController controller}) {
    if(controller != null){
      controller.clear();
    }
  }
  Future<void> dispose() async {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    commentController.dispose();
  }
}