import '../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Images",
        iconBack: false,
        signout: true,
      ),
      body: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          var cubit = ImageCubit.get(context);
          return Column(
            children: [
              IconStepper(
                stepColor: AppColors.lightGreyColor,
                activeStepColor: AppColors.primaryColor,
                activeStepBorderColor: AppColors.primaryColor,
                lineColor: AppColors.primaryColor,
                activeStep: cubit.indexTabShow,
                icons: const [
                  Icon(
                    Icons.image_outlined,
                  ),
                  Icon(Icons.add_a_photo_outlined),
                ],
                onStepReached: (index) {
                  cubit.emitIndexTabShow(index);
                },
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              cubit.indexTabShow == 0
                  ? const Expanded(child: ShowImagesDriverWidget())
                  : const Expanded(child: UploadImageScreen())
            ],
          );
        },
      ),
    );
  }
}
