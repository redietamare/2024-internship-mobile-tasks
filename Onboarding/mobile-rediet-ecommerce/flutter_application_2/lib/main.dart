// import 'dart:ffi';
// import 'dart:ffi';
// import 'dart:ui';

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/addupdate.dart';
import 'package:flutter_application_2/search.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes:{
        '/search':(context)=>Searchpage(),
        
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white,
      title: Row(
        
        children: [
          ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(55,55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
               )
          ),
          onPressed: null, 
          child: const Text('')),
          const SizedBox(width:20),
            Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('July 14,2023',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'RobotoMono'
                    )
                     ,),
                    Row(
                      children: [
                        const Text('Hello,',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: 'RobotoMono'
                        ),),
                        Text('Yohannes',
                        style: GoogleFonts.lato(
                          fontSize:15,
                        
                          ),
                ) 
                      ],
                    ),
                  ],
                ),
                OutlinedButton(
                iconAlignment: IconAlignment.start,
                style: OutlinedButton.styleFrom(  
                
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  fixedSize: const Size(50, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
               )   
                ),
                onPressed: null,
                 child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                 )
                 )
              ],), 
          ),
        ],
      ),
      ),
      body:  
      SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          
            children: <Widget>[
              const SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                const Text('Available Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fixedSize: Size(50, 25),
                      ),
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) =>  Searchpage()));
                  },
                   child: const Icon(
                    Icons.search,
                    color: Colors.black,
                   )
                   )
                ],
              ),
            SizedBox(height: 15,),
             ProductCard(sampleproduct:Product(image: 'assets/images/shoes_2.jpg',productname: "Derby Leather Shoes",price:"123",type: 'Men\'s shoes',rating: '5.0') ),
             SizedBox(height: 40,),
             ProductCard(sampleproduct:Product(image: 'assets/images/shoes_2.jpg',productname: "Boots shoes ",price:"222",type: 'Women\'s shoes',rating: '4.0') ),
             SizedBox(height: 40,),
             ProductCard(sampleproduct:Product(image: 'assets/images/shoes_2.jpg',productname: "Brown shoes",price:"553",type: 'Men\'s shoes',rating: '4.0') ),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
           Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddUpdate()),
                        );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFF3f51f3), 
        // Using the hex color
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class ProductCard extends StatelessWidget {
  const ProductCard({super.key,required this.sampleproduct});
  final Product sampleproduct;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){Navigator.push(context, 
                    MaterialPageRoute(builder: (context) =>  DetailsPage(sampleproduct: sampleproduct,)));},
      child: Container(
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(sampleproduct.image),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    sampleproduct.productname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: Text(
                    sampleproduct.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    sampleproduct.type,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4.0),
                      Text(sampleproduct.rating),
                    ],
                    
                  ),
                  
                ),
                
              ],
              
            ),
          ],
              ),
            ),
          ),
    );;
  }
}

class Product {
 final String image;
  String productname;
  String price;
  String type;
  String rating;
  Product(
    {required this.image,required this.productname,required this.price,required this.type,required this.rating}
    );
  

}