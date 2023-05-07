import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_trainer/backend/models/user_model.dart';
import 'package:ielts_trainer/frontend/utils/widgets/register_alertdialog.dart';
import 'package:ielts_trainer/frontend/auth/login_view.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

import '../../backend/services/userfirebase_service.dart';
import '../utils/const/mycolors.dart';
import '../utils/widgets/paddings.dart';
import '../utils/widgets/text_field.dart';

class RegisterationView extends StatefulWidget {
  const RegisterationView({super.key});

  @override
  State<RegisterationView> createState() => _RegisterationViewState();
}

class _RegisterationViewState extends State<RegisterationView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool loginPage = true;
  String errorMsg = '* Fill in the required fields';
  bool showpass = false;
  bool passmatch = false;

  final _fnameController = TextEditingController(text: '');
  final _lnameController = TextEditingController(text: '');
  final _cpasswordController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _contactController = TextEditingController(text: '');
  String? userCountry;
  String? fld;
  String cCode = "+92";
  UserFirebaseServices userFbService = UserFirebaseServices();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Visibility(
            visible: !isLoading,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: s.height,
                width: s.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    gradient: RadialGradient(radius: 1, colors: [
                      MyColors.primaryBtnC,
                      MyColors.primaryBtnC.withOpacity(0.6)
                    ])),
              ),
            ),
          ),
          Visibility(
            visible: !isLoading,
            child: Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.2,
                child: SvgPicture.asset(
                  "lib/assets/imgs/scholar.svg",
                  color: Colors.white,
                  height: 500,
                  width: 300,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: s.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: isLoading
                    ? SpinKitDoubleBounce(
                        color: MyColors.primaryBtnC,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: s.height * 0.1,
                          ),
                          Text(
                            "Register Yourself ",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "and join IELTS Trainer community! ",
                                style: GoogleFonts.openSans(
                                  color: MyColors.primaryBtnC.withOpacity(0.7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.03,
                          ),
                          Padding(
                            padding: kPaddingSymetric(false),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                //  color: Colors.grey.shade200),
                              ),
                              height: s.height * 0.2,
                              width: s.width * 0.5,
                              child: Center(
                                child: Lottie.asset(
                                    "lib/assets/lotties/register.json",
                                    repeat: false,
                                    reverse: true),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          Container(
                            width: double.infinity,
                            height: s.height,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        errorMsg,
                                        style: GoogleFonts.openSans(
                                          color: errorMsg ==
                                                  '** Invalid required fields'
                                              ? Colors.red
                                              : MyColors.primaryBtnC
                                                  .withOpacity(0.7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Focus(
                                          onFocusChange: (v) {
                                            if (v) {
                                              setState(() {
                                                errorMsg =
                                                    "Should be atleast 4 characters";
                                              });
                                            }
                                          },
                                          child: getTextFeild(
                                            s,
                                            "First name",
                                            _fnameController,
                                            ((v) {
                                              return null;
                                            }),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: getTextFeild(
                                          s,
                                          "Last name",
                                          _lnameController,
                                          ((v) {
                                            return null;
                                          }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Focus(
                                          onFocusChange: (v) {
                                            if (v) {
                                              setState(() {
                                                errorMsg =
                                                    "Should be atleast 6 characters and contain numbers";
                                              });
                                            }
                                          },
                                          child: getTextFeild(
                                            s,
                                            "Username",
                                            _usernameController,
                                            ((v) {
                                              return null;
                                            }),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: 70,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey[300]!)),
                                                  child: CountryCodePicker(
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cCode = value.dialCode!;
                                                      });
                                                    },
                                                    initialSelection: cCode,
                                                    boxDecoration:
                                                        BoxDecoration(
                                                            color: Colors
                                                                .grey[200]),
                                                  ),
                                                ),
                                              ),
                                              getContactTextFeild(
                                                  s,
                                                  "Contact",
                                                  _contactController,
                                                  (p0) => null),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Focus(
                                          onFocusChange: (v) {
                                            if (v) {
                                              setState(() {
                                                errorMsg = "Use a valid Email";
                                              });
                                            }
                                          },
                                          child: getTextFeild(
                                            s,
                                            "Email",
                                            _emailIdController,
                                            ((v) {
                                              return null;
                                            }),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: SizedBox(
                                            height: 70,
                                            width: s.width * 0.75,
                                            child: Center(
                                              child: TextFormField(
                                                obscureText: !showpass,
                                                controller: _passwordController,
                                                validator: (v) {
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    suffixIcon: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            showpass =
                                                                !showpass;
                                                          });
                                                        },
                                                        child: Icon(showpass
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off)),
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                    prefixIcon:
                                                        const Icon(Icons.key),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors
                                                              .grey[300]!),
                                                    ),
                                                    hintText: "Enter password",
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: MyColors
                                                              .primaryBtnC),
                                                    )),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: SizedBox(
                                            height: 70,
                                            width: s.width * 0.75,
                                            child: Center(
                                              child: TextFormField(
                                                onChanged: (v) {
                                                  if (_passwordController
                                                              .text.length ==
                                                          8 ||
                                                      _passwordController
                                                              .text.length >
                                                          8) {
                                                    if (v ==
                                                        _passwordController
                                                            .text) {
                                                      setState(() {
                                                        passmatch = true;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        passmatch = false;
                                                      });
                                                    }
                                                  }
                                                },
                                                obscureText: !showpass,
                                                controller:
                                                    _cpasswordController,
                                                validator: (v) {
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    suffixIcon: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            showpass =
                                                                !showpass;
                                                          });
                                                        },
                                                        child: Icon(showpass
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off)),
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                    prefixIcon:
                                                        const Icon(Icons.key),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: passmatch
                                                              ? Colors.green
                                                              : Colors
                                                                  .grey[300]!),
                                                    ),
                                                    hintText:
                                                        "Confirm password",
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: passmatch
                                                              ? Colors.green
                                                              : Colors.red),
                                                    )),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  width: 0.5)),
                                          height: 70,
                                          width: s.width * 0.75,
                                          child: Center(
                                            child: ListTile(
                                              title: Text(userCountry ??
                                                  "Select Country"),
                                              trailing:
                                                  const FaIcon(Icons.edit),
                                              onTap: () {
                                                showCountryPicker(
                                                    context: context,
                                                    countryListTheme:
                                                        CountryListThemeData(
                                                      flagSize: 25,
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .blueGrey),
                                                      bottomSheetHeight:
                                                          500, // Optional. Country list modal height
                                                      //Optional. Sets the border radius for the bottomsheet.
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      //Optional. Styles the search field.
                                                      inputDecoration:
                                                          InputDecoration(
                                                        labelText: 'Search',
                                                        hintText:
                                                            'Start typing to search',
                                                        prefixIcon: const Icon(
                                                            Icons.search),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: const Color(
                                                                    0xFF8C98A8)
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    onSelect: (Country c) =>
                                                        setState(() {
                                                          userCountry = c
                                                              .displayName
                                                              .split('[')
                                                              .first;
                                                        }));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: s.width * 0.3,
                                        child: DropdownButton(
                                          // Initial Value
                                          value: items[0],

                                          elevation: 0,
                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          alignment: Alignment.center,
                                          // Array list of items
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              fld = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: kPaddingSymetric(false),
                                        child: MaterialButton(
                                            textColor: MyColors.background,
                                            height: 50,
                                            minWidth: s.width * 0.6,
                                            color: loginPage
                                                ? MyColors.primaryBtnC
                                                : MyColors.secondaryBtnC,
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              String email =
                                                  _emailIdController.text;
                                              String username =
                                                  _usernameController.text;
                                              String pass =
                                                  _passwordController.text;
                                              bool isEmailValid =
                                                  EmailValidator.validate(
                                                      email);

                                              if (email == '' ||
                                                  pass == '' ||
                                                  username == '' ||
                                                  email.isEmpty ||
                                                  pass.isEmpty ||
                                                  username.isEmpty) {
                                                setState(() {
                                                  errorMsg ==
                                                      '** Invalid required fields';
                                                });
                                                Toast.show(
                                                    "Fields can't be empty",
                                                    duration:
                                                        Toast.lengthShort);
                                              } else if (pass.length < 8 ||
                                                  !isEmailValid ||
                                                  username.length < 5) {
                                                setState(() {
                                                  errorMsg ==
                                                      '** Invalid required fields';
                                                });

                                                Toast.show(
                                                    "Fields can't be too short",
                                                    duration:
                                                        Toast.lengthShort);
                                              } else {
                                                setState(() {
                                                  isLoading = true;
                                                });

                                                int res =
                                                    await userFbService.signUp(
                                                  Usermodel(
                                                      fname:
                                                          _fnameController.text,
                                                      lname:
                                                          _lnameController.text,
                                                      email: _emailIdController
                                                          .text,
                                                      username:
                                                          _usernameController
                                                              .text,
                                                      country: userCountry,
                                                      fld: fld,
                                                      contact:
                                                          "$cCode ${_contactController.text.trim()}"),
                                                  _passwordController.text,
                                                );
                                                if (res == 200) {
                                                  setState(() {
                                                    isLoading = false;
                                                    loginPage = true;
                                                  });
                                                  showCongratsAlert(
                                                    context,
                                                    s,
                                                    _fnameController.text,
                                                  );
                                                  Toast.show(
                                                      "Account created successfuly!",
                                                      duration:
                                                          Toast.lengthShort);
                                                }
                                                if (res == 300) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });

                                                  Toast.show(
                                                      "Username already taken ☹️!",
                                                      duration:
                                                          Toast.lengthShort);
                                                } else if (res == 400) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  Toast.show(
                                                      "Seems like internet issue 🌏!",
                                                      duration:
                                                          Toast.lengthShort);
                                                  Toast.show("Try again later!",
                                                      duration:
                                                          Toast.lengthShort);
                                                }
                                              }
                                            }),
                                      ),
                                      TextButton(
                                        child: const Text(
                                          "Login Instead!",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        onPressed: () {
                                          _usernameController.clear();
                                          _passwordController.clear();
                                          _emailIdController.clear();
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const LoginView()),
                                              (route) => false);
                                        },
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

List<String> items = ['MBBS', 'Others'];
