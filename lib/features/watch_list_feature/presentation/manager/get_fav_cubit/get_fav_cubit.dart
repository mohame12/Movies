import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/fire_model.dart';
import 'get_fav_state.dart';


class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit() : super(GetFavInitial());
  Future<void> getTasks() async {
    emit(GetFavLoading());
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('FavList').get();

      List<FireModel> favorites = snapshot.docs.map((doc) {
        return FireModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      if (favorites.isNotEmpty) {
        emit(GetFavSucess(favorites: favorites));
      } else {
        emit(GetFavFailure(e: "No favorites found"));
      }
    } catch (e) {
      emit(GetFavFailure(e: e.toString()));
    }
  }


  Future<void> deleteTask(String docID) async {
    try {
      await FirebaseFirestore.instance.collection('FavList').doc(docID).delete();
      emit(DeleteFavSuccess());
      await getTasks();
    } catch (e) {
      emit(DeleteFavFailure(e: e.toString()));
    }
  }
}
