import '../models/lang.dart';
extension RemoveParentheses on String
{
  String removeParentheses()
  {
    return substring(1, length - 1);
  }
}

extension LangResolver on Locale {
  String toLang() {
    switch (this) {
      case Locale.uk:
        return 'uk_UA';
      case Locale.be:
        return 'be_BY';
      case Locale.enRu:
        return 'en_RU';
      case Locale.tr:
        return 'tr_TR';
      case Locale.ar:
        return 'ar_EG';
      case Locale.en:
      default:
        return 'en_US';
    }
  }
}