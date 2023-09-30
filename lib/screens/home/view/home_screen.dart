import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jenil_chandarana_demo2/screens/home/controller/controller.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    HomeController controller = Get.put(HomeController());
    controller.apiCalling();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Oceanmtech"),
          actions: [
            IconButton(onPressed: () {
              if(scaffoldKey.currentState!.isEndDrawerOpen)
                {
                  scaffoldKey.currentState!.closeEndDrawer();
                }
              else {
                scaffoldKey.currentState!.openEndDrawer();
              }// Scaffold.of(context).openDrawer();
            }, icon: const Icon(Icons.filter_alt))
          ],
        ),
        body: Obx(
          // ignore: unrelated_type_equality_checks
          () => controller.displayData != false
              ? controller.displaySearchingAnimation == true?Center(child: Lottie.asset("assets/animations/searching.json"),):ListView.builder(
                  itemCount: controller.data.value.productData!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12,blurRadius: 3,spreadRadius: 3)
                        ]
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 10.h,
                            width: 10.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) => Center(
                                        child: Lottie.asset(
                                            "assets/animations/error.json"),
                                      ),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                            child: Lottie.asset(
                                                "assets/animations/loading image.json"),
                                          ),
                                  imageUrl:
                                      "${controller.data.value.productData![index].image}",fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 2.h,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                child: Text("${controller.data.value.productData![index].name}",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 13.sp),),),
                              Text("Category : ${controller.data.value.productData![index].categoryName}",style: GoogleFonts.poppins(fontSize: 11.sp),),
                              Text("Price : ${controller.data.value.productData![index].price}",style: GoogleFonts.poppins(fontSize: 11.sp),),
                              Text("Rate : ${controller.data.value.productData![index].averageRating}",style: GoogleFonts.poppins(fontSize: 11.sp),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Lottie.asset("assets/animations/fetching data.json"),
                ),
        ),
        endDrawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(
              () =>  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const  Text("Name : A to Z"),
                      const Spacer(),
                      Checkbox(value: controller.button[0], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller.filterBasedOnNameAtoZ();
                        for(int i =0; i<controller.button.length;i++)
                          {
                            if(i==0)
                              {
                                controller.button[i]=true;
                              }
                            else
                              {
                                controller.button[i]=false;
                              }
                          }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Name : Z to A"),
                      const Spacer(),
                      Checkbox(value: controller.button[1], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller.filterBasedOnNameZtoA();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==1)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Category : A to Z"),
                      const Spacer(),
                      Checkbox(value: controller.button[2], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller.filterBasedOnCategoryAtoZ();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==2)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Category : Z to A"),
                      const Spacer(),
                      Checkbox(value: controller.button[3], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller.filterBasedOnCategoryZtoA();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==3)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Short by ratings"),
                      const Spacer(),
                      Checkbox(value: controller.button[4], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller.filterBasedOnRatingsHighToLow();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==4)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Price : High to Low"),
                      const Spacer(),
                      Checkbox(value: controller.button[5], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller. filterBasedOnPriceHighToLow();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==5)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      const Text("Price : Low to High"),
                      const Spacer(),
                      Checkbox(value: controller.button[6], onChanged: (value) {
                        scaffoldKey.currentState!.closeEndDrawer();
                        controller. filterBasedOnPriceLowtoHigh();
                        for(int i =0; i<controller.button.length;i++)
                        {
                          if(i==6)
                          {
                            controller.button[i]=true;
                          }
                          else
                          {
                            controller.button[i]=false;
                          }
                        }
                      },),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  TextButton(onPressed: () {
                    scaffoldKey.currentState!.closeEndDrawer();
                    controller.apiCalling();
                    for(int i=0;i<controller.button.length;i++)
                      {
                        controller.button[i] = false;
                      }
                  }, child: const Text("Reset"),),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
