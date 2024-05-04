sealed class PolicyState {}

class PolicyInitial extends PolicyState {}

class PolicyLoading extends PolicyState {}

class PolicyLoaded extends PolicyState {}

class PolicyFetchFailed extends PolicyState {}
