import 'package:flutter/material.dart';
import 'package:medical/components/components.dart';
import 'package:medical/components/under_part.dart';
import 'package:medical/screens/login_screen.dart';
import 'package:medical/screens/screens.dart';
import 'package:medical/widgets/widgets.dart';

import '../classes/language.dart';
import '../classes/language_constants.dart';
import '../main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          leading: Image.asset("images/push_services_med.png"),
          leadingWidth: 70,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Language>(
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onChanged: (Language? language) async {
                  if (language != null) {
                    // ignore: no_leading_underscores_for_local_identifiers
                    Locale _locale = await setLocale(language.languageCode);
                    // ignore: use_build_context_synchronously
                    MyApp.setLocale(context, _locale);
                  }
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "images/push_services_med.png",
                ),
                const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: const Text(
                            "Inscrivez-vous Dans SIHATI !",
                            // ignore: unnecessary_const
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin:const EdgeInsets.only(top: 10.0, bottom: 10.0) ,
                          
                          child: const Text(
                            "Votre information est en sécurité avec nous",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              const RoundedInputField(
                                  hintText: "Nom Et Prenom", icon: Icons.man),
                              const RoundedInputField(
                                  hintText: "Numer De Telephone", icon: Icons.phone),
                              const RoundedPasswordField(),
                              RoundedButton(text: 'REGISTER', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>const LoginScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
