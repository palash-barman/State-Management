
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _list = [
    "assets/image/images1.jpg",
    "assets/image/images2.jpg",
    "assets/image/images3.jpg",
    "assets/image/image4.jpg",
  ];
  var selectIndex = 0;
  bool isLoading =true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        isLoading=false;
      });
    });

    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          title: const Text("SetState",style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body:isLoading?const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth:5,
              color: Colors.red,
            ),
          ),
        ) :Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 350,
              width: double.infinity,
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(_list[selectIndex],height: 250,fit: BoxFit.fill,width: double.infinity,)),

                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if(selectIndex>0){
                            setState(() {
                              selectIndex--;
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle,),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "${selectIndex + 1}",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap:(){
                          if(selectIndex>=0&&selectIndex<_list.length-1){
                            setState(() {
                              selectIndex++;
                              print(selectIndex);
                            });
                          }

                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Colors.pink, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
