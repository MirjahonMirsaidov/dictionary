import 'package:translator/translator.dart';

class Translator {
  final String text;
  Translator(this.text);

  Future<dynamic> main() async {
    final translator = GoogleTranslator();

    var translation = await translator.translate(text, to: 'ru');
    print(translation);

    return translation;
  }
}
