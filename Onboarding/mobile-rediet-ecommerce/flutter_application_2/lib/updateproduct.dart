import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Updateproduct extends StatefulWidget {
  Updateproduct({super.key,required this.sampleproduct});
  Product sampleproduct;
  @override
  _Updateproductstate createState() => _Updateproductstate();
}

class _Updateproductstate extends State<Updateproduct> {
  File? _image;
  

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 30,right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Color(0xFF3f51f3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 70),
                    const Text(
                      'Update Product',
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
          
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: Icon(
                            Icons.image_search_outlined,
                            color: Colors.grey[600],
                            size: 50,
                          ),
                        ),
                      
                        _image == null
                            ? Center(
                                  child: Text(
                                    'Upload Image',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                )
                            : Image.file(
                                _image!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ],
                    ),
                
                ),
                const SizedBox(height: 10,),
                const Text('name',
                style: TextStyle(
                  fontSize: 18,
                ),),
                CustomTextInputField(labelText: widget.sampleproduct.productname ,staticText: '',maxLines: 1, flag: false,),
                const SizedBox(height: 10,),
                const Text('category',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField(labelText: widget.sampleproduct.type,staticText: '', maxLines: 1,flag: false),
                const SizedBox(height: 10,),
                const Text('price',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField( labelText: widget.sampleproduct.price ,staticText: '\$',maxLines: 1,flag: false,),
                const SizedBox(height: 10,),
                const Text('description',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField(labelText: widget.sampleproduct.description , staticText: '',maxLines: 4,flag: true,),
                SizedBox(height: 40,),
                SizedBox(
                width: double.infinity, // Full width of the parent
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF3f51f3), // Button color
                    minimumSize: const Size(double.infinity, 50), // Minimum width and height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                  onPressed: () {
                  
                  },
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              
          
            
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomTextInputField extends StatefulWidget {
  final String? labelText;
  final int? maxLines;
  final String? staticText;
  final bool? flag;

  CustomTextInputField({
    required this.labelText,
    this.maxLines = 1,
    required this.staticText,
    required this.flag,
  });

  @override
  _CustomTextInputFieldState createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.labelText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.flag == true ? 110 : 35,
      child: Stack(
        children: [
          TextField(
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              // labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xFFF3F3F3),
            ),
            controller: _controller,
          ),
          if (widget.staticText != null)
            Positioned(
              right: 10,
              top: 12, // Adjust the top position to align the text correctly
              child: Text(
                widget.staticText!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
