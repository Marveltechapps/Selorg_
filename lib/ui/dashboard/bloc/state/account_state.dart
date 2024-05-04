sealed class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class FetchAccountSuccess extends AccountState {}

class FetchAccountError extends AccountState {}

class AccountLogOut extends AccountState {}