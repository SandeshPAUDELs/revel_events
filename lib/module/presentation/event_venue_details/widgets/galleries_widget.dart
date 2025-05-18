import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/data/secure_storage/secure_storage.dart';
import 'package:event_app/module/presentation/cubit/image/image_cubit.dart';
import 'package:event_app/module/presentation/cubit/image/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return BlocProvider(
      create: (_) => ImageCubit(SecureStorage())..loadImage(),

      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Galleries', style: textTheme.titleLarge),
              BlocBuilder<ImageCubit, ImageState>(
                builder: (context, state) {
                  if (state is ImageErrorState) {
                    return SizedBox(
                      height: 225.h,
                      child: Center(child: Text(state.message)),
                    );
                  } else if (state is ImageLoadedState) {
                    return ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.r),
                      ),
                      child: Image.network(
                        state.imageUrl,
                        width: double.infinity,
                        height: 225.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ImageCubit>().saveImage(
                    'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
                  );
                },
                child: const Text('Save Image'),
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return BlocBuilder<ImageCubit, ImageState>(
                    builder: (context, state) {
                      if (state is ImageErrorState) {
                        return SizedBox(
                          height: 225.h,
                          child: Center(child: Text(state.message)),
                        );
                      } else if (state is ImageLoadedState) {
                        return ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.r),
                          ),
                          child: Image.network(
                            state.imageUrl,
                            width: double.infinity,
                            height: 225.h,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
