import 'package:flutter_application_1/images/presentation/show_images/widget/list_view_search_wdget.dart';

import '../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class ShowImagesDriverWidget extends StatelessWidget {
  const ShowImagesDriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return Column(
          children: [
            const SearchWidget(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: cubit.textController.text.isNotEmpty
                    ? cubit.searchList.isEmpty
                        ? Text(
                            "No Data In Search",
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        : const ListViewSearchWidget()
                    : const PaginationFireStoreWidget()),
          ],
        );
      },
    );
  }
}
