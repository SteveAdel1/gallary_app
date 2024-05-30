import 'dart:io';

import 'package:app/core/routes/routes_pages_names.dart';
import 'package:app/features/home/home_view/home_view.dart';
import 'package:app/features/home/view_model/get_gallery_cubit/get_galley_cubit.dart';
import 'package:app/features/home/view_model/get_gallery_cubit/git_gallery_states.dart';
import 'package:app/features/image_picker/view_model/image_cubit.dart';
import 'package:app/features/image_picker/view_model/images_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickerImageView extends StatelessWidget {
  BuildContext homecontext;
  PickerImageView({super.key, required this.homecontext});

  @override
  Widget build(BuildContext context) {
    var vm = GalleryCubit();
    return Expanded(
      child: Container(
        height: 300,
        width: 260,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
        child: BlocProvider<ImageCubit>(
          create: (context) => ImageCubit(),
          child: BlocBuilder<ImageCubit, ImageStates>(
            builder: (context, state) {
              switch (state) {
                case LoadingImageState():
                  {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ImageCubit>()
                                  .pickImage(ImageSource.gallery);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.browse_gallery_sharp),
                                  const Text("gallary"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ImageCubit>()
                                  .pickImage(ImageSource.camera);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.camera),
                                  const Text("camera"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                case LoadingUpload():
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                case SuccessImagesState():
                  {
                    return Center(
                      child: Column(
                        children: [
                          Image.file(File(state.image!.path), height: 180),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<ImageCubit>().pickAnotherImage();
                              },
                              child: const Text("Pick another image")),
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ImageCubit>()
                                    .uploadImage(state.image!);
                              },
                              child: const Text("upload"))
                        ],
                      ),
                    );
                  }
                case ErrorImageState():
                  {
                    return Center(
                      child: Column(
                        children: [
                          Text(state.errorMassage),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<ImageCubit>().pickAnotherImage();
                              },
                              child: Text("Try again..."))
                        ],
                      ),
                    );
                  }
                case SuccessUpload():
                  {
                    var vm = context.read<GalleryCubit>();
                    vm.getGalleryList();
                    Navigator.of(context).pop();

                    // Navigator.pushNamed(context, RoutesPagesNames.homeView);

                    return Text('');
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
