
import '../../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class PaginationFireStoreWidget extends StatelessWidget {
  const PaginationFireStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestorePagination(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      viewType: ViewType.grid,
      limit: 10,
      query: FirebaseFirestore.instance
          .collection("users")
          .doc(CacheHelper.getData(key: "documentId"))
          .collection("images"),
      itemBuilder: (context, documentSnapshot, index) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        return ItemImageWidget(
            imageItem: ImageItem(
                imagePath: data["imagePath"],
                imageName: data["imageName"],
                imageDate: data["imageDate"],
                imageTime: data["imageTime"],
                docId: data["docId"]));
      },
    );
  }
}
