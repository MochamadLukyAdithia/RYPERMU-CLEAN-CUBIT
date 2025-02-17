import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clean_arch/common/widgets/button/basic_button.dart';
import 'package:spotify_clean_arch/common/widgets/icon/mode_icon_button.dart';
import 'package:spotify_clean_arch/core/configs/assets/App_Svg.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';
import 'package:spotify_clean_arch/presentation/auth/pages/choose_auth.dart';
import 'package:spotify_clean_arch/presentation/mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/black-man-posing-with-headphones_23-2148171661.jpg?uid=R150935078&ga=GA1.1.612644777.1738683820&semt=ais_authors_boost'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppSvg.logo),
                ),
                Spacer(), 
                Text(
                  "Choose Mode",
                  style: TextStyle(
                    color: AppPallete.greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconMode(
                      onTap: () {
                        // Navigator.pop(context);
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      text: "Light",
                      svgPicture: AppSvg.light,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconMode(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      text: "Dark",
                      svgPicture: AppSvg.dark,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                BasicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseAuth(),
                      ),
                    );
                  },
                  title: "Selanjutnya",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
