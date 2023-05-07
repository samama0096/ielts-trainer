import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_trainer/backend/prefs/user_prefs.dart';
import 'package:ielts_trainer/backend/services/userfirebase_service.dart';
import 'package:ielts_trainer/frontend/auth/register_view.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';
import '../utils/const/mycolors.dart';
import '../utils/widgets/login_alertdialog.dart';
import '../utils/widgets/paddings.dart';
import '../utils/widgets/text_field.dart';
import '../views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool showpass = false;
  String errorMsg = '';
  AuthPrefs prefs = AuthPrefs();
  final _usernameController = TextEditingController(text: '');
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _resetEmailController = TextEditingController(text: '');
  UserFirebaseServices userFbService = UserFirebaseServices();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
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
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    "lib/assets/imgs/scholar.svg",
                    color: Colors.white,
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: isLoading
                    ? SpinKitDoubleBounce(
                        color: MyColors.primaryBtnC,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: s.height * 0.05,
                          ),
                          Padding(
                            padding: kPaddingSymetric(false),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                // color: Colors.white
                              ),
                              height: s.height * 0.2,
                              width: s.width * 0.5,
                              child: Center(
                                child: Lottie.asset(
                                    "lib/assets/lotties/register.json",
                                    reverse: true,
                                    repeat: false),
                              ),
                            ),
                          ),
                          Text(
                            "IELTS TRAINER",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.02,
                          ),
                          Container(
                            width: double.infinity,
                            height: s.height * 0.7,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "* Fill required fields with valid details! ",
                                      style: GoogleFonts.openSans(
                                        color: MyColors.primaryBtnC
                                            .withOpacity(0.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: s.height * 0.02,
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
                                        padding: const EdgeInsets.only(top: 8),
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
                                                          showpass = !showpass;
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
                                                        color:
                                                            Colors.grey[300]!),
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
                                    SizedBox(
                                      height: s.height * 0.05,
                                    ),
                                    MaterialButton(
                                        textColor: MyColors.background,
                                        height: 50,
                                        minWidth: s.width * 0.75,
                                        color: MyColors.primaryBtnC,
                                        child: const Text(
                                          "Login",
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
                                              EmailValidator.validate(email);

                                          if (email == '' ||
                                              pass == '' ||
                                              email.isEmpty ||
                                              pass.isEmpty) {
                                            Toast.show(
                                                "Fields can't be empty...",
                                                duration: Toast.lengthShort);
                                          } else if (pass.length < 8 ||
                                              !isEmailValid) {
                                            Toast.show(
                                                "Fields can't be this short!",
                                                duration: Toast.lengthShort);
                                          } else {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            bool res =
                                                await userFbService.signIn(
                                                    _emailIdController.text,
                                                    _passwordController.text);
                                            if (res) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              Toast.show(
                                                  "Logged in as ${_emailIdController.text}",
                                                  duration: Toast.lengthShort);

                                              await prefs.saveUserDataToDevice(
                                                  username, email);
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          const HomeView()),
                                                  (route) => false);
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              Toast.show("Invalid Details!",
                                                  duration: Toast.lengthShort);
                                            }
                                          }
                                        }),
                                    SizedBox(
                                      height: s.height * 0.05,
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Don't have an account? Sign Up now >",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      onPressed: () {
                                        _usernameController.clear();
                                        _passwordController.clear();
                                        _emailIdController.clear();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const RegisterationView()),
                                            (route) => false);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      onPressed: () {
                                        showDataAlert(
                                            context, s, _resetEmailController,
                                            () {
                                          setState(() {
                                            errorMsg = '';
                                          });
                                        });
                                      },
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
