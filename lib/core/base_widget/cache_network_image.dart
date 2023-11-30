


import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

class CacheNetworkImage extends StatelessWidget {
  const CacheNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(child: Image.asset(AnimationAssets.loadingIconOfImage)),
        errorWidget: (context, url, error) => const Icon(Icons.error),);
  }
}