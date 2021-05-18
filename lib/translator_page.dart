import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'translator.dart';

const kSearchInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    FontAwesomeIcons.pencilAlt,
    color: Color(0xff47C690), //Color(0xff47C690)
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  hintText: 'Enter word',
  hintStyle: TextStyle(color: Colors.grey),
);

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  dynamic translatedText;
  String userInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaffd0), //Color(0xffeaffd0)
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 20,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  ),
                  alignment: Alignment.centerLeft,
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff47C690),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Theme(
                data: ThemeData(
                  primaryColor: Color(0xff47C690), //Color(0xff47C690)
                ),
                child: TextField(
                  decoration: kSearchInputDecoration,
                  onChanged: (val) {
                    userInput = val;
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (userInput != '') {
                  Translator translator = Translator(userInput);
                  var txt = await translator.main();
                  setState(() {
                    translatedText = txt;
                  });
                }
              },
              child: Text(
                'Translate',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff47C690)),
              ),
            ),
            translatedText != null
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Text(
                          translatedText != null ? '$translatedText' : '',
                          style: TextStyle(fontSize: 17),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
