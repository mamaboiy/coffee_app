import 'package:coffee/goggle_fonts.dart';
import 'package:coffee/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
class CoverPages extends StatelessWidget {
  CoverPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/coffee.jpg'),fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Gap(200),
                      Text("Coffee", style: myStyle(35, Colors.white, FontWeight.bold),),
                      Text("Is always a good idea",style: myStyle(30, Colors.white, FontWeight.bold),),
                    ],
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("You can't buy happiness, but you can buy coffee,",style: myStyle(18,Colors.white,FontWeight.bold),),
                ),
                Gap(250),
                InkWell(
                  onTap: (){
                    Get.to(HomePage());
                  },
                  child: Card(
                      elevation: 6,
                      child: Container(
                        height: 50,
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: one,
                        ),
                        child: Center(child: Text("Enjoy Coffee",style: myStyle(23, Colors.white))),
                      )
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

