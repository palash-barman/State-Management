import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _list = [
    "assets/image/images.jpg",
    "assets/image/images3.jpg",
    "assets/image/img_lights.jpg",
    "assets/image/term-bg-1-666de2d9.jpg",
  ];
  var selectIndex = 0;
  bool isLoading =true;

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),(){
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
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
