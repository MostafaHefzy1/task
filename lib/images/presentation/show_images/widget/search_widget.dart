import 'package:flutter/cupertino.dart';

import '../../../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: TextFormField(
            controller: cubit.textController,
            onChanged: (value) {
              cubit.emitTextController();
              if (value.isNotEmpty) {
                cubit.searchLogic(searchName: cubit.textController.text);
              } else {
                cubit.clearSearch();
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "search",
              contentPadding: const EdgeInsets.all(5),
              border: const OutlineInputBorder(
                  borderRadius: DefaultComponent.defaultBorderRaduis),
              suffixIcon: IconButton(
                icon: const Icon(
                  CupertinoIcons.xmark_circle,
                ),
                onPressed: () {
                  cubit.clearSearch();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
