class CreateFavState {}

class CreateFavInitial extends CreateFavState {}
class CreateFavLoading extends CreateFavState {}
class CreateFavSucess extends CreateFavState {}
class CreateFavFailure extends CreateFavState {
  final String error;
  CreateFavFailure({required this.error});
}




class UpdateFavLoading extends CreateFavState {}
class UpdateFavSucess extends CreateFavState {}
class UpdateFavFailure extends CreateFavState {
  final String error;

  UpdateFavFailure({required this.error});
}
