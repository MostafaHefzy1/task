
import '../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}
class EmitIndexTabState extends ImageState {}
class GetImagePickedSuccessState extends ImageState {}
class GetImagePickedErrorState extends ImageState {}


class AddImageInFirebaseLoadingState extends ImageState {}
class AddImageInFirebaseSuccessState extends ImageState {}
class AddImageInFirebaseFailedState extends ImageState {}

class AddDataInFireStoreSuccessState extends ImageState{
  final ImageItem imageItem  ;

  AddDataInFireStoreSuccessState(this.imageItem);

}



class GetSearchSuccessState extends ImageState {}

class EmitTextControllerState extends ImageState {}



class DeleteImageInFirebaseLoadingState extends ImageState {}
class DeleteImageInFirebaseSuccessState extends ImageState {}
class DeleteImageInFirebaseFailedState extends ImageState {}