import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clean_arch/common/widgets/appbar/appbar.dart';
import 'package:spotify_clean_arch/common/widgets/button/basic_button.dart';
import 'package:spotify_clean_arch/core/configs/assets/App_Svg.dart';
import 'package:spotify_clean_arch/data/models/auth/create_user_req.dart';
import 'package:spotify_clean_arch/domain/usecase/auth/signin_usecase.dart';
// import 'package:spotify_clean_arch/presentation/auth/pages/sign_in_screen.dart';
import 'package:spotify_clean_arch/presentation/auth/pages/sign_up_screen.dart';
import 'package:spotify_clean_arch/presentation/home/wrapper.dart';
import 'package:spotify_clean_arch/service_locator.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttomNav(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BasicAppbar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppSvg.logo,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _registerText(),
                  SizedBox(
                    height: 30,
                  ),
                  _registerForm(
                      context: context,
                      text: "Email",
                      controller: _emailController),
                  SizedBox(
                    height: 30,
                  ),
                  _registerForm(
                      context: context,
                      text: "Password",
                      controller: _passwordController),
                  SizedBox(
                    height: 30,
                  ),
                  BasicButton(
                      onPressed: () async {
                        var result = await sl<SigninUsecase>().call(
                          params: CreateUserReq(
                            email: _emailController.text.toString().trim(),
                            password:
                                _passwordController.text.toString().trim(),
                          ),
                        );
                        result.fold((l) {
                          var snackBar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }, (r) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ),
                            (route) => false,
                          );
                        });
                      },
                      title: "Login")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _registerText() {
    return Text(
      'Login',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _registerForm(
      {required BuildContext context,
      required String text,
      required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buttomNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have\'nt an account?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
