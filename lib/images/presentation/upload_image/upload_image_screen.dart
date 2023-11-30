import '../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is AddImageInFirebaseLoadingState) {
          showLoadingIndicator(context);
        }
        if (state is AddDataInFireStoreSuccessState) {
          Navigator.pop(context);

          ImageCubit.get(context).uploadImage = null;
          Navigator.pushNamed(context, Routes.detailsImageScreen,
              arguments: state.imageItem);
        }
        if (state is AddImageInFirebaseFailedState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    MyHelper.getImageByTwoOption(
                      context: context,
                      textOne: "Camera",
                      textTwo: "Gallery",
                      functionOne: () {
                        cubit.getImage(source: ImageSource.camera);
                        Navigator.pop(context);
                      },
                      functionTwo: () {
                        cubit.getImage(source: ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: const BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: DefaultComponent.defaultBorderRaduis,
                      ),
                      child: Column(
                        children: [
                          Text("Upload again",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: AppColors.appBarColor)),
                          SizedBox(
                            height: AppSize.s10,
                          ),
                          cubit.uploadImage == null
                              ? Image.asset(
                                  ImageAssets.uploadImage,
                                  height: 100.h,
                                  width: 250.w,
                                  fit: BoxFit.contain,
                                  color: AppColors.greyColor,
                                )
                              : Image.file(File(cubit.uploadImage!.path)),
                          SizedBox(
                            height: AppSize.s10,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                cubit.uploadImage != null
                    ? CustomButton(
                        textButton: "Upload",
                        onPressed: () {
                          cubit.uploadImageToFirebaseStorage();
                        },
                        widthButton: double.infinity,
                      )
                    : const DisableContainer(
                        text: "Upload",
                        width: double.infinity,
                      ),
                SizedBox(
                  height: AppSize.s40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
