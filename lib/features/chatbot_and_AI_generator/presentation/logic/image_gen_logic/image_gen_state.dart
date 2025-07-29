part of 'image_gen_cubit.dart';

@immutable
abstract class GenState {}

class GenInitial extends GenState {}

class Loading extends GenState {
  final bool isLoading;
  Loading(this.isLoading);
}

class Searching extends GenState {
  final bool isSearching;
  Searching(this.isSearching);
}

class ImageLoaded extends GenState {
  final Uint8List? img;
  ImageLoaded(this.img);
}
