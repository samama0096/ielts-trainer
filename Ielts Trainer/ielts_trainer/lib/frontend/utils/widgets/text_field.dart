import 'package:flutter/material.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';

Widget getTextFeild(Size s, String key, TextEditingController controller,
    String? Function(String?)? validator) {
  return SizedBox(
    height: 70,
    width: s.width * 0.75,
    child: Center(
      child: TextFormField(
        obscureText: key == "password" ? true : false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[500]!),
            prefixIcon: Icon(key == "Email"
                ? Icons.email
                : key == "First name"
                    ? Icons.abc
                    : key == "Last name"
                        ? Icons.abc_rounded
                        : key == "password"
                            ? Icons.password_outlined
                            : Icons.account_box),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            ),
            hintText: key,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: MyColors.primaryBtnC),
            )),
      ),
    ),
  );
}

Widget getContactTextFeild(Size s, String key, TextEditingController controller,
    String? Function(String?)? validator) {
  return SizedBox(
    height: 70,
    width: s.width * 0.5,
    child: Center(
      child: TextFormField(
        keyboardType: TextInputType.phone,
        obscureText: key == "password" ? true : false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[500]!),
            prefixIcon: const Icon(
              Icons.mobile_friendly,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            ),
            hintText: key,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: MyColors.primaryBtnC),
            )),
      ),
    ),
  );
}
