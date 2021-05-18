import 'package:flutter/material.dart';
import 'translator_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Translator',
        ),
        backgroundColor: Color(0xff47C690),
      ),
      backgroundColor: Color(0xffeaffd0),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 20,
              child: Image(
                image: AssetImage('images/main.png'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "EXPLORE NEW WORDS",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff40514e)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                "World's leading online source for translating definitions, synonyms, word origins, example sentences and more...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17, color: Colors.grey.shade600, height: 1.5),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    'Getting Started',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TranslatePage(),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff47C690)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
