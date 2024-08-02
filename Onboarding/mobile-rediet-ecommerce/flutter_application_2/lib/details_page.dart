import 'package:flutter/material.dart';
import 'package:flutter_application_2/addupdate.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/updateproduct.dart';



class DetailsPage extends StatefulWidget {
  final Product sampleproduct;
  String currentnumber = '39';
  DetailsPage({super.key, required this.sampleproduct});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool toggle = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(widget.sampleproduct.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 270.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text(
                          widget.sampleproduct.type,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 14.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 10.0),
                            Text(widget.sampleproduct.rating),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text(
                          widget.sampleproduct.productname,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 14.0),
                        child: Text(
                          widget.sampleproduct.price,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Size:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomOutlinedButton(number: '39',currentnumber:widget.currentnumber,toggler:(){
                          setState(() {
                             widget.currentnumber = '39';
                          });
                        }),
                       CustomOutlinedButton(number: '40',currentnumber:widget.currentnumber,toggler:(){
                          setState(() {
                             widget.currentnumber = '40';
                          });
                        }),
                        CustomOutlinedButton(number: '41',currentnumber:widget.currentnumber,toggler:(){
                          setState(() {
                             widget.currentnumber = '41';
                          });
                        }),
                        CustomOutlinedButton(number: '42',currentnumber:widget.currentnumber,toggler:(){
                          setState(() {
                             widget.currentnumber = '42';
                          });
                        }),
                        CustomOutlinedButton(number: '43',currentnumber:widget.currentnumber,toggler:(){
                          setState(() {
                             widget.currentnumber = '43';
                          });
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red, // Text color
                            side: BorderSide(color: Colors.red), // Border color
                            minimumSize: const Size(150, 60), // Size of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Border radius
                            ),
                          ),
                          onPressed: () {
                            // Button action
                          },
                          child: const Text('DELETE'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF3f51f3), // Button color
                            minimumSize: const Size(150, 60), // Size of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Border radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Updateproduct(sampleproduct: widget.sampleproduct),
                              ),
                            );
                          },
                          child: const Text(
                            'UPDATE',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 25.0,
              left: 23.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                mini: true,
                tooltip: 'Back to Main',
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF3f51f3),
                  size:24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // Adjust the radius as needed
                ),
                backgroundColor: Colors.white, // Hex color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  

class CustomOutlinedButton extends StatefulWidget {
  final String number;
  String currentnumber;
  void Function() toggler;
  CustomOutlinedButton({super.key,required this.number,required this.currentnumber,required this.toggler});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
 

  
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(50, 70),
            backgroundColor: (widget.currentnumber==widget.number)? Color(0xFF3f51f3): Colors.white,
      
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side :BorderSide.none,
            ),
          ),
          onPressed: () {
            debugPrint(widget.currentnumber);
            widget.toggler();
          },
          child: Center(
            child: Text(
              widget.number,
              style:  TextStyle(
                color: (widget.currentnumber == widget.number)? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    
    );

  }
}
