abstract class ApiRequestException {
  final String errorMsg;

  ApiRequestException(this.errorMsg);
}

class UserAlreadyExists extends ApiRequestException {
  UserAlreadyExists(String errorMsg) : super(errorMsg);
}

class OtherException extends ApiRequestException {
  OtherException(String errorMsg) : super(errorMsg);
}

class UserNotExists extends ApiRequestException {
  UserNotExists(String errorMsg) : super(errorMsg);
}

class AuthKeyNotFound extends ApiRequestException {
  AuthKeyNotFound(String errorMsg) : super(errorMsg);
}
