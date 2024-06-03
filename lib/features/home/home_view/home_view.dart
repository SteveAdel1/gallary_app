import 'package:app/core/helpers/cache_helper.dart';
import 'package:app/features/home/view_model/get_gallery_cubit/git_gallery_states.dart';
import 'package:app/features/image_picker/picker_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/widgets/custom_login_background.dart';
import '../view_model/get_gallery_cubit/get_galley_cubit.dart';
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
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: MainBg(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(children: [ Image.asset("assets/images/ellipse1627.png",fit: BoxFit.fill,),
                  ]),
                  Stack(children: [

                    Image.asset("assets/images/vector0.png"),
                    Image.asset("assets/images/vctor1.png"),
                    Image.asset("assets/images/vector2.png"),
                    Image.asset("assets/images/vector3.png"),
                    Image.asset("assets/images/vector4.png"),
                    Image.asset("assets/images/vector5.png"),
                    Image.asset("assets/images/group7.png"),
                  ],),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFDDCDFF),
                      image: DecorationImage(
                          image: AssetImage("assets/images/rectangle.png"
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),

                ],) ,
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "welcome",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            " mina",
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/profilepic.png",
                        ),
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
                          shape:  RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0),
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
                                backgroundColor: Color.fromARGB(120, 251, 250,
                                    250), // Make sure the AlertDialog also has a transparent background
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape:  RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0),
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
                                            padding: EdgeInsets.all(
                                                8), // Adjust padding to change border thickness
                                            decoration: BoxDecoration(
                                               // Background color of the border
                                              borderRadius: BorderRadius.circular(
                                                  20), // Adjust border radius here
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  20), // Match border radius with ClipRRect
                                              child: Image.network(
                                                categoryDataList.images[index]
                                                    .toString(),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          );

                                          // return Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(30),
                                          //   ),
                                          //   child: ClipRRect(
                                          //       borderRadius:
                                          //           BorderRadius.circular(10),
                                          //       child: Image.network(
                                          //           categoryDataList.images[index]
                                          //               .toString())),
                                          // );
                                        },
                                      ),

                                    )));
                          }
                      }
                    },
                  )
                ],
              ),

            ],
          ),
        ));
  }
}
