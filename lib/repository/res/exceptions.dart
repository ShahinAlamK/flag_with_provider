class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message $_prefix";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? msg]) : super(msg, "No Internet");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? msg]) : super(msg, "Request TimeOut");
}

class InternalServerException extends AppExceptions {
  InternalServerException([String? msg]) : super(msg, "Internal Server Error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? msg]) : super(msg, "Invalid Url");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? msg]) : super(msg, "Bad Request");
}

class InvalidDataException extends AppExceptions {
  InvalidDataException([String? msg]) : super(msg, "Invalid Error");
}
