import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/features/detailes_feature/data/models/details_model/DetailsModel.dart';
import 'package:movies_app/features/watch_list_feature/data/models/fire_model.dart';
import 'create_fav_state.dart';

class CreateFavCubit extends Cubit<CreateFavState> {
  CreateFavCubit() : super(CreateFavInitial());

  bool isFav = false;

  createTask({required DetailsModel model}) async {
    emit(CreateFavLoading());

    DocumentReference docRef = FirebaseFirestore.instance.collection("FavList").doc(model.id.toString());

    try {
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        FireModel fireModel = FireModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
        fireModel.isFav = !fireModel.isFav;
        isFav = fireModel.isFav;

        await docRef.update(fireModel.toJson());
        emit(UpdateFavSucess());
      } else {

        FireModel fireModel = FireModel(details: model, docID: docRef.id, isFav: true);
        isFav = fireModel.isFav;

        await docRef.set(fireModel.toJson());
        emit(CreateFavSucess());
      }
    } catch (e) {
      print(e.toString());
      emit(CreateFavFailure(error: e.toString()));
    }
  }




}
