

import 'package:flutter/material.dart';
import 'package:medical/welcome/content_model.dart';
import 'package:medical/classes/language.dart';

import '../classes/language_constants.dart';
import '../main.dart';
import '../screens/login_doctor.dart';
import '../screens/signup_screen.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Welcome1> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,

              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                 SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/push_services_med.png",
                            height: 345,
                          ),
                            Text(
                            translation(context).welcome,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            textAlign: TextAlign.center,
                            translation(context).present_welcome,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),


                 SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/medecin-gps.png",
                            height: 300,
                          ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                textAlign: TextAlign.center,
                              translation(context).welcome2,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                            ),
                          const SizedBox(height: 20),
                          
                        ],
                      ),
                    ),

                SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/find medcine.png",
                            height: 345,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            translation(context).welcome3,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width*0.50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.indigo),
              
              child: Text(
                style: const TextStyle(
                  color: Colors.white,
                ),
                  currentIndex == contents.length - 1 ? translation(context).suivant : translation(context).suivant,
                   ),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                   Navigator.pushNamed(context, '/patient_or_doctor');
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.indigo,
      ),
    );
  }
}
