import 'package:movies_app/features/browse_tap_feature/data/models/genres_model.dart';

class GenrasState {}

class GenrasInitial extends GenrasState {}
class GenrasLoading extends GenrasState {}
class GenrasSucess extends GenrasState {
  final List<Genres> browse;

  GenrasSucess({required this.browse});
}
class GenrasFailure extends GenrasState {
  final String error;

  GenrasFailure({required this.error});
}
