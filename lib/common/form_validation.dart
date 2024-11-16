RegExp removeWhiteSpace = RegExp(r'\s');

String? validatePhoneNumber(String value) {
  // Null or empty string is invalid phone number
  if (value.isEmpty) {
    return 'Field is required';
  }
  // You may need to change this pattern to fit your requirement.
  // I just copied the pattern from here: https://regexr.com/3c53v
  const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

RegExp nameRegExp = RegExp(r"^[A-Za-z]+$");
String? validateName(String value) {
  if (value.isEmpty) {
    return 'Field is required';
  }
  if (!nameRegExp.hasMatch(value)) {
    return 'Please enter valid name';
  }
  return null;
}

RegExp emailRegExp = RegExp(
    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Field is required';
  }
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

RegExp phoneRegExp = RegExp(
    r"^(\+234|234|0)(701|702|703|704|705|706|707|708|709|802|803|804|805|806|807|808|809|810|811|812|813|814|815|816|817|818|819|909|908|901|902|903|904|905|906|907)([0-9]{7})$");
String? validateNigerianNumber(String value) {
  if (value.isEmpty) {
    return 'Field is required';
  }
  if (!phoneRegExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

RegExp passwordRegExp = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!/%*?+=_^.&])[A-Za-z\d@$!%*?+=_^.&]{8,}$");
String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Field is required';
  }
  if (!passwordRegExp.hasMatch(value)) {
    return '';
  }
  return null;
}

///Password must be a minimum of 8 characters, with letters, numbers, and a symbol.
bool isValidPassword(String input) => passwordRegExp.hasMatch(input);
