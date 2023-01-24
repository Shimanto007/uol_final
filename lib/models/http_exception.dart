class HttpException implements Exception {
  final String message;

  HttpException(this.message);


  @override

  toString() {
    // print(message);
    return message;
    // return super.toString();
  }

}