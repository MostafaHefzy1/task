import '../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';
import 'package:intl/intl.dart';

class ImageCubit extends Cubit<ImageState> {
  static ImageCubit get(context) => BlocProvider.of(context);
  ImageCubit() : super(ImageInitial());

  int indexTabShow = 0;
  emitIndexTabShow(int index) {
    indexTabShow = index;
    clearSearch();
    emit(EmitIndexTabState());
  }

  final ImagePicker picker = ImagePicker();
  XFile? uploadImage;
  Future<void> getImage({required ImageSource source}) async {
    XFile? selectedImages = await picker.pickImage(source: source);
    if (selectedImages != null) {
      uploadImage = selectedImages;
      emit(GetImagePickedSuccessState());
    } else {
      emit(GetImagePickedErrorState());
    }
  }

  UploadTask? uploadTask;
  void uploadImageToFirebaseStorage() async {
    emit(AddImageInFirebaseLoadingState());
    final path = uploadImage!.name;
    final file = File(uploadImage!.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapShot = await uploadTask!.whenComplete(() {});
    await snapShot.ref.getDownloadURL().then((value) async {
      addImagesToFireStore(ImageItem(
          imagePath: value,
          imageName: path,
          imageDate: DateFormat('y-MM-dd').format(DateTime.now()),
          imageTime: DateFormat('h:mm').format(DateTime.now())));
    }).catchError((error) {
      emit(AddImageInFirebaseFailedState());
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addImagesToFireStore(ImageItem imageItem) async {
    Map<String, dynamic> productMap = imageItem.toMap();
    await firestore
        .collection("users")
        .doc(CacheHelper.getData(key: "documentId"))
        .collection("images")
        .add(productMap)
        .then((value) async {
      await firestore
          .collection("users")
          .doc(CacheHelper.getData(key: "documentId"))
          .collection("images")
          .doc(value.id)
          .update({"docId": value.id});

      getImagesToFireStore();
      clearSearch();
      emit(AddDataInFireStoreSuccessState(ImageItem(
          imagePath: imageItem.imagePath,
          imageName: imageItem.imageName,
          imageDate: imageItem.imageDate,
          imageTime: imageItem.imageTime,
          docId: value.id)));
    });
  }

  List<ImageItem> imageItemList = [];
  void getImagesToFireStore() async {
    await firestore
        .collection("users")
        .doc(CacheHelper.getData(key: "documentId"))
        .collection("images")
        .get()
        .then((value) {
      imageItemList.clear();
      for (int i = 0; i < value.docs.length; i++) {
        imageItemList.add(ImageItem.fromJson(value.docs[i].data()));
      }
    }).catchError((error) {});
  }

  deleteImageInFirebase({required String docId}) {
    emit(DeleteImageInFirebaseLoadingState());
    firestore
        .collection("users")
        .doc(CacheHelper.getData(key: "documentId"))
        .collection("images")
        .doc(docId)
        .delete()
        .then((value) async {
      getImagesToFireStore();
      clearSearch();
      emit(DeleteImageInFirebaseSuccessState());
    }).catchError((error) {
      emit(DeleteImageInFirebaseFailedState());
    });
  }

  List<ImageItem> searchList = [];
  void searchLogic({required String searchName}) {
    searchName = searchName.toLowerCase();
    searchList = imageItemList.where((search) {
      var searchTitle = search.imageName!.toLowerCase();
      return searchTitle.contains(searchName);
    }).toList();
    emit(GetSearchSuccessState());
  }

  void clearSearch() {
    searchList.clear();
    textController.clear();
    emit(GetSearchSuccessState());
  }

  TextEditingController textController = TextEditingController();
  emitTextController() {
    textController = textController;
    emit(EmitTextControllerState());
  }
}
