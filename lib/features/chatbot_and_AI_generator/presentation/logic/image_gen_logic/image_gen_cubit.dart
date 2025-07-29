import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'image_gen_state.dart';

class GenCubit extends Cubit<GenState> {
  GenCubit() : super(GenInitial());

  bool isLoading = false;
  bool isSearching = false;
  Uint8List? img;

  void loadingChange(bool val) {
    isLoading = val;
    emit(Loading(isLoading));
  }
  void searchingChange(bool val) {
    isSearching = val;
    emit(Searching(isSearching));
  }
  void getImage(Uint8List val) {
    img = val;
    emit(Searching(isSearching));
  }
}
