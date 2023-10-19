extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(r"^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$")
        .hasMatch(this);
  }

  bool get isLink => contains("https://") || contains("http://");

  bool get isAssets => contains("assets/");

  String get capitalizedString => replaceAllMapped(
      RegExp(r'\b\w'), (match) => match.group(0)!.toUpperCase());

  String get flagLink => "https://flagsapi.com/$this/flat/64.png";
}
