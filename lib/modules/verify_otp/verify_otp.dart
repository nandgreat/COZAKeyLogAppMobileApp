import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/helpers.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/color_palette.dart';
import '../../res/images.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: deviceHeight(context) * 0.4,
                  child: SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset(
                        ENTER_OTP_ILLUSTRATION,
                        height: 150.0,
                        width: 150.0,
                      )),
                ),
                Container(
                  width: deviceWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter OTP",
                        style: TextStyle(
                            height: 1,
                            fontSize: 28.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        child: Text(
                          "A four Digit code as been sent to\n+234 8979 8634 84",
                          style: TextStyle(height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: Row(children: [
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.grey[100]!, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200),
                          contentPadding: const EdgeInsets.only(
                              top: 20,
                              left: 20.0,
                              right: 20.0),
                          isDense: true,
                          errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(width: 10.0,),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                          if(value.length == 0){
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.grey[100]!, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200),
                          contentPadding: const EdgeInsets.only(
                              top: 20,
                              left: 20.0,
                              right: 20.0),
                          isDense: true,
                          errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(width: 10.0,),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                          if(value.length == 0){
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.grey[100]!, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200),
                          contentPadding: const EdgeInsets.only(
                              top: 20,
                              left: 20.0,
                              right: 20.0),
                          isDense: true,
                          errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(width: 10.0,),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                          if(value.length == 0){
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.grey[100]!, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200),
                          contentPadding: const EdgeInsets.only(
                              top: 20,
                              left: 20.0,
                              right: 20.0),
                          isDense: true,
                          errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),

                      ),
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Didn't receive code yet?",
                      style: TextStyle(
                          fontSize: 12.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                    label: "Submit",
                    onPressed: () {
                      Get.to(const ResetPasswordScreen());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
