import 'package:app/core/helpers/cache_helper.dart';
import 'package:app/features/home/view_model/get_gallery_cubit/git_gallery_states.dart';
import 'package:app/features/image_picker/picker_image_view.dart';
import 'package:app/features/image_picker/testpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../view_model/get_gallery_cubit/get_galley_cubit.dart';
import '../widgets/home_image_item.dart';
import '../widgets/main_bg.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // var vm = GalleryCubit();
  @override
  void initState() {
    // vm.getGalleryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = context.read<GalleryCubit>();
    vm.getGalleryList();
    final List<Image> categoryList = [
      Image.asset("assets/images/eleps.png"),
      Image.asset("assets/images/eleps.png"),
      Image.asset("assets/images/eleps.png"),
      Image.asset("assets/images/eleps.png"),
    ];
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: MainBg(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "welcome",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " mina",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/eleps.png",
                    width: 100,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: 15.0,
                    ),
                    label: Text('logout'),
                    onPressed: () {
                      CacheHelper.clearAllData();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.file_upload_rounded,
                      color: Colors.red,
                      size: 15.0,
                    ),
                    label: Text('Uploud image'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Color.fromARGB(99, 0, 0, 0),
                        barrierDismissible:
                            true, // Allow dismissing by tapping outside
                        builder: (_) {
                          return AlertDialog(
                            content: PickerImageView(
                                homecontext: context), // Your custom widget
                            backgroundColor: Color.fromARGB(80, 251, 250,
                                250), // Make sure the AlertDialog also has a transparent background
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<GalleryCubit, GalleryStates>(
                bloc: vm,
                builder: (context, state) {
                  switch (state) {
                    case LoadingGalleryState():
                      {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    case ErrorGalleryState():
                      {
                        return Text("error");
                      }
                    case SuccessGalleryState():
                      {
                        var categoryDataList = state.galleryList;
                        return Expanded(
                            child: SizedBox(
                                height: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 1.1),
                                    itemCount: categoryDataList.images.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                categoryDataList.images[index]
                                                    .toString())),
                                      );
                                    },
                                  ),
                                )));
                      }
                  }
                },
              )
            ],
          ),
        ));
  }
}
