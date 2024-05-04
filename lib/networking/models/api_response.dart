import 'package:sel_org/networking/api_exception.dart';

sealed class ApiResult<S>{
  const ApiResult();
}

final class Success<S> extends ApiResult<S> {
  const Success(this.value);
  final S value;
}

class Error<S> extends ApiResult<S> {
  const Error(this.exception);
  final NetworkExceptions exception;
}