import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clean_arch/common/widgets/appbar/appbar.dart';
import 'package:spotify_clean_arch/common/widgets/button/basic_button.dart';
// import 'package:spotify_clean_arch/core/configs/assets/App_Image.dart';
import 'package:spotify_clean_arch/core/configs/assets/App_Svg.dart';
import 'package:spotify_clean_arch/presentation/auth/pages/sign_in_screen.dart';
import 'package:spotify_clean_arch/presentation/auth/pages/sign_up_screen.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppSvg.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppSvg.bootomPattern,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          BasicAppbar(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppSvg.logo,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enjoy Listening Your Music Easily!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Buat harimu menyenangkan dengan mendengarkan musik favoritmu",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BasicButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          title: "Register",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: BasicButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          title: "Login",
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
