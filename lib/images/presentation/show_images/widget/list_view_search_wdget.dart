import 'package:flutter_application_1/core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class ListViewSearchWidget extends StatelessWidget {
  const ListViewSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                ItemImageWidget(imageItem: cubit.searchList[index]),
            separatorBuilder: (context, index) => const Divider(
                  color: AppColors.lightGreyColor,
                  thickness: 2,
                ),
            itemCount: cubit.searchList.length);
      },
    );
  }
}
