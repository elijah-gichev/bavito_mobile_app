abstract class ApiRequestException {}

class UserAlreadyExists extends ApiRequestException {}

class OtherException extends ApiRequestException {}

class UserNotExists extends ApiRequestException {}

class PetNotExists extends ApiRequestException {}

class AuthKeyNotFound extends ApiRequestException {}
