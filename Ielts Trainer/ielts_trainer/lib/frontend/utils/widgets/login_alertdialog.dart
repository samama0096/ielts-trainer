import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../backend/services/userfirebase_service.dart';

import '../const/mycolors.dart';
import 'common_snackbar.dart';

showDataAlert(BuildContext context, Size s,
    TextEditingController resetEmailController, VoidCallback setState) {
  UserFirebaseServices userFbService = UserFirebaseServices();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const Text(
            "Send Reset Password Email",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          content: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey)),
                      height: 60,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: Center(
                          child: TextFormField(
                            controller: resetEmailController,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.italic),
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: InputBorder.none,
                              hintText: "your e-mail",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        bool res =
                            EmailValidator.validate(resetEmailController.text);
                        if (!res) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              commonSnackBar(
                                  context, Colors.red, "Invalid Email!"));
                        } else if (res) {
                          setState;

                          int res = await userFbService
                              .sendResetPassEmail(resetEmailController.text);
                          if (res == 200) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                commonSnackBar(context, MyColors.primaryBtnC,
                                    "Email Sent!"));
                          } else if (res == 300) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                commonSnackBar(context, Colors.redAccent,
                                    "Can;t send right now!"));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryBtnC,
                        // fixedSize: Size(250, 50),
                      ),
                      child: const Text(
                        "Send",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Text('Note:'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'You will recieve a link to reset your password on the provided Email. Check your Email and get your password changed!',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
