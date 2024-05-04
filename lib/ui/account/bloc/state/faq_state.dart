sealed class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqLoaded extends FaqState {}

class FaqFetchFailed extends FaqState {}
