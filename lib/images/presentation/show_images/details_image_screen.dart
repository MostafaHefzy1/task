
import '../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class DetailsImageScreen extends StatelessWidget {
  final ImageItem imageItem;
  const DetailsImageScreen({super.key, required this.imageItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(iconBack: true, title: "Details Image"),
      body: BlocConsumer<ImageCubit, ImageState>(
        listener: (context, state) {
          if (state is DeleteImageInFirebaseLoadingState) {
            showLoadingIndicator(context);
          }
          if (state is DeleteImageInFirebaseSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.imageScreen, (route) => false);
          }
          if (state is DeleteImageInFirebaseFailedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = ImageCubit.get(context);
          return Padding(
            padding: DefaultComponent.paddingToAuthation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: CacheNetworkImage(
                    imageUrl: imageItem.imagePath!,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Image Name :  ${imageItem.imageName!}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Image Date Upload :  ${imageItem.imageDate!}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Image Time Upload :  ${imageItem.imageTime!}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                    widthButton: double.infinity,
                    textButton: "Delete Image",
                    onPressed: () {
                      cubit.deleteImageInFirebase(docId: imageItem.docId!);
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
