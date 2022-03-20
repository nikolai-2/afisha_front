import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/route.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';
import 'package:oggetto_afisha_front/presentation/screens/home_screen.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      "937852679790-sddhdlp76o3edoc8upli6gpl5fcvgl3v.apps.googleusercontent.com",
  scopes: ['profile', 'https://www.googleapis.com/auth/calendar'],
);

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GoogleSignInAccount? account;
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {}

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/oggetto.png'),
              const Spacer(),
              SvgPicture.asset('assets/person.svg'),
              const Spacer(),
              const Text('Мероприятия', style: labelText),
              const SizedBox(height: 15),
              const Text(
                'Присоединяйся к сообществу коллег и проводи досуг гораздо интереснее!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC9C9C9),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await _handleSignIn();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                  );
                },
                child: Ink(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: categoryCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/google.svg'),
                        const SizedBox(width: 10),
                        const Text('Войти с помощью Google',
                            style: optionStyle),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
