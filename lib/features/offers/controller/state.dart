
abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {}

class OffersError extends OffersState {
  final String message;
  OffersError(this.message);
}
