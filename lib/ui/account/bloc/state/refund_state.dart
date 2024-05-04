sealed class RefundState {}

class RefundInitial extends RefundState {}

class RefundLoading extends RefundState {}

class RefundLoaded extends RefundState {}

class RefundFetchFailed extends RefundState {}
