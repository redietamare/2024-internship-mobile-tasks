import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddUpdate extends StatefulWidget {
  @override
  _AddUpdateState createState() => _AddUpdateState();
}

class _AddUpdateState extends State<AddUpdate> {
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
                    const SizedBox(width: 80),
                    const Text(
                      'Add Products',
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Container for image upload
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
                CustomTextInputField(staticText: '',maxLines: 1, flag: false,),
                const SizedBox(height: 10,),
                const Text('category',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField(staticText: '', maxLines: 1,flag: false),
                const SizedBox(height: 10,),
                const Text('price',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField(staticText: '\$',maxLines: 1,flag: false,),
                const SizedBox(height: 10,),
                const Text('description',
                style: TextStyle(
                  fontSize: 18,
                )),
                CustomTextInputField(staticText: '', maxLines: 4,flag: true,),
                SizedBox(height: 10,),
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
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
              width: double.infinity, // Full width of the parent
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red), // Button color
                  minimumSize: const Size(double.infinity, 50), // Minimum width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                ),
                onPressed: () {
          
                },
                child: const Text(
                  'DELETE',
                  style: TextStyle(
                    color: Colors.red,
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

class CustomTextInputField extends StatelessWidget {
  final String? labelText;
  final int? maxLines;
  final String? staticText;
  final bool? flag;

  CustomTextInputField({this.labelText, this.maxLines = 1, required this.staticText,required this.flag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: flag==true ? 110 : 35,
      child: Stack(
        children:[
          TextField(
          maxLines: maxLines,
          
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
              
            ),
            filled: true,
            fillColor: Color(0xFFF3F3F3),
          ),
        ),
        if (staticText!=null)
        Positioned(
          right: 10,
          child: Text(
            staticText!,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          )
          )
        ],
      ),
  
    );
  }
}