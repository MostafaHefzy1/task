


import '../../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class ItemImageWidget extends StatelessWidget {
  final ImageItem imageItem;
  const ItemImageWidget({super.key, required this.imageItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsImageScreen,
            arguments: imageItem);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 90.h,
            width: 90.w,
            child: CacheNetworkImage(imageUrl: imageItem.imagePath!),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          Text(
            imageItem.imageName!,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(),
          )
        ],
      ),
    );
  }
}
