// ignore_for_file: file_names, avoid_print, unused_import, non_constant_identifier_names, unnecessary_new, unused_local_variable, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:whisper/layout/SignUp/setPassword.dart';
import 'package:whisper/models/TextFieldValidation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail(String text, {Key? key}) : super(key: key);
  @override
  _VerifyEmail createState() => _VerifyEmail();
}

class _VerifyEmail extends State<VerifyEmail> {
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController VerifyEmailController = new TextEditingController();
  @override
  void initState() {
    VerifyEmailController.text = ""; //set the initial value of text field
    String VerifyE = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text(
                        " Email Verification",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 5),
                          TextFormField(
                            obscureText: _isObscure,
                            obscuringCharacter: "*",
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Color.fromARGB(179, 255, 0, 0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  String VerifyE = 'null';
                                  setState(() {
                                    _isObscure = !_isObscure;

                                    VerifyEmailController.text = VerifyE;
                                  });
                                },
                              ),
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor:
                                  const Color.fromARGB(255, 179, 177, 177)
                                      .withOpacity(0.3),
                              labelText: "Verification Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                            ),
                            validator: (value) =>
                                VerifyEmailFieldValidator.validate(value!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Container(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Verification Successful");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const setPassword()));
                            print('begin 1');
                            //VerifyEmail(VerifyEmailController.text);
                            print('begin 2');
                          }
                        },
                        color: const Color(0xff0095FF),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // VerifyEmail(
  //   String VerifyE,
  // ) async {
  //   Map data = {
  //     'code': VerifyE,
  //   };
  //   var jsonData = null;
  //   Map mapResponse;
  //   Map dataResponse;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   //SharedPreferences.setMockInitialValues({});
  //   print('test 1');
  //   var response = await http.patch(
  //       Uri.parse(
  //           "http://habibsw-env-1.eba-rktzmmab.us-east-1.elasticbeanstalk.com/api/signUp/verifyEmail"),
  //       body: data);
  //   if (response.statusCode == 200) {
  //     print('test 3');
  //     print(response.body);
  //     setState(() {
  //       print('test 4');
  //       //sharedPreferences.setString("token", jsonData['token']);
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => const setPassword()),
  //           (Route<dynamic> route) => false);
  //       print('test 5');
  //       showModalBottomSheet<void>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return Container(
  //             height: 200,
  //             color: const Color.fromARGB(0, 255, 255, 255),
  //             child: Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Text(
  //                     response.body,
  //                     style: const TextStyle(
  //                       color: Color(0xff0095FF),
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 20,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     });
  //   } else if (response.statusCode == 400) {
  //     print('test 6');
  //     setState(() {
  //       print('test 7');
  //       showModalBottomSheet<void>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return Container(
  //             height: 200,
  //             color: const Color.fromARGB(0, 255, 255, 255),
  //             child: Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Text(
  //                     response.body,
  //                     style: const TextStyle(
  //                       color: Color(0xff0095FF),
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 20,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     });
  //   } else {
  //     print('bad');
  //   }
  // }
}
