import 'package:movies_app/features/watch_list_feature/data/models/fire_model.dart';

class GetFavState {}
class GetFavInitial extends GetFavState {}
class GetFavLoading extends GetFavState {}
class DeleteFavSuccess extends GetFavState {}
class DeleteFavFailure extends GetFavState {
  final String e;

  DeleteFavFailure({required this.e});
}
class GetFavSucess extends GetFavState {
  final List<FireModel> favorites;

  GetFavSucess({required this.favorites});
}
class GetFavFailure extends GetFavState {
  final String e;

  GetFavFailure({required this.e});
}
