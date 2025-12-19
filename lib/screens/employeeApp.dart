import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class employeeApp extends StatefulWidget {
  const employeeApp({super.key});

  @override
  State<employeeApp> createState() => _employeeAppState();
}

class _employeeAppState extends State<employeeApp> {

  // Create FromState
  final _formKey = GlobalKey<FormState>();


  // Create Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


  // Add Employee Details to FirebaseFirestore
  Future <void> addEmployee() async{
    try{
      await FirebaseFirestore.instance
          .collection("employee")
          .doc(_nameController.text.trim())
          .set({
        "name": _nameController.text.trim(),
        "id": _idController.text.trim(),
        "department": _departmentController.text.trim(),
        "phone": "+94${_phoneController.text.trim()}"
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Employee data add successfully!"),
            duration: Duration(
                seconds: 3
            ),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(20)
                )
            ),
            elevation: 10,
            showCloseIcon:true,
            closeIconColor:Colors.white
          )
      );
    }catch(e){
      print ("Error: $e");
    }
  }


  // Clear TextControllers
  Future <void> clear() async{
    _nameController.clear();
    _idController.clear();
    _departmentController.clear();
    _phoneController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar:AppBar(
        title:const Text("Add New Employee",
          style:TextStyle(
            color:Colors.white,
            fontSize:25,
            fontWeight:.w800
          )
        ),
        centerTitle:true,
        backgroundColor:Colors.green,
        iconTheme:IconThemeData(
          color:Colors.white,
          size:26
        )
      ),
      body:Form(
        key:_formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:40,horizontal:10),
          child: ListView(
            children:[

              // Employee_Name
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  controller:_nameController,
                  validator:(value){
                    if(value==null || value.isEmpty){
                      return "This field can't be left empty";
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(15)),
                      borderSide:BorderSide(
                        color:Colors.blue,
                        width:1
                      )
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(15)),
                      borderSide:BorderSide(
                        color:Colors.deepPurple,
                        width:2
                      )
                    ),
                    errorBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(15)),
                      borderSide:BorderSide(
                        color:Colors.red,
                        width:2
                      )
                    ),
                    focusedErrorBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(15)),
                      borderSide:BorderSide(
                        color:Colors.red,
                        width:2
                      )
                    ),
                    labelText:"Name",
                    labelStyle:TextStyle(
                      fontSize:18,
                      color:Colors.black
                    ),
                    hintText:"Example: John",
                    hintStyle:TextStyle(
                      color:Colors.black45
                    ),
                    prefixIcon:Icon(
                      Icons.person_rounded,
                      color:Colors.black,
                    ),
                  )
                ),
              ),

              // Employee_ID
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  controller:_idController,
                  validator:(value){
                    if(value==null || value.isEmpty){
                      return "This field can't be left empty";
                    }
                    return null;
                  },
                    decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.blue,
                                width:1
                            )
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.deepPurple,
                                width:2
                            )
                        ),
                        errorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        labelText:"ID",
                        labelStyle:TextStyle(
                            fontSize:18,
                            color:Colors.black
                        ),
                      hintText:"Enter employee ID",
                      hintStyle:TextStyle(
                        color:Colors.black45
                      ),
                      prefixIcon:Icon(
                        Icons.pin,
                        color:Colors.black
                      )
                    )
                ),
              ),

              // Employee_Department
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  controller:_departmentController,
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return "This can't be left empty";
                    }
                    return null;
                  },
                    decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.blue,
                                width:1
                            )
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.deepPurple,
                                width:2
                            )
                        ),
                        errorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        labelText:"Department",
                        labelStyle:TextStyle(
                          fontSize:18,
                          color:Colors.black
                        ),
                      hintText:"Enter employee department",
                      hintStyle:TextStyle(
                        color:Colors.black45
                      ),
                      prefixIcon:Icon(
                        Icons.maps_home_work_rounded,
                        color:Colors.black
                      )
                    )
                ),
              ),

              // Employee_Contact_Number
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: TextFormField(
                  controller:_phoneController,
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return "This field can't be left empty";
                    }
                    return null;
                  },
                    decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.blue,
                                width:1
                            )
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.deepPurple,
                                width:2
                            )
                        ),
                        errorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            borderSide:BorderSide(
                                color:Colors.red,
                                width:2
                            )
                        ),
                        labelText:"Phone",
                        labelStyle:TextStyle(
                          fontSize:18,
                          color:Colors.black
                        ),
                      helperText:"Example: 77*******",
                      helperStyle:TextStyle(
                        color:Colors.black45,
                        fontSize:15
                      ),
                      hintStyle:TextStyle(
                        color:Colors.black45
                      ),
                      prefixIcon:Icon(
                        Icons.phone_android_rounded
                      ),
                      prefixText:"+94",
                      prefixStyle:TextStyle(
                        color:Colors.black,
                        fontSize:17
                      )
                    ),
                  keyboardType:TextInputType.phone,
                  maxLength:9,
                ),
              ),

              Row(
                mainAxisAlignment:.center,
                children:[
                  // Clear_Button
                  Container(
                    height:50,
                    width:150,
                    margin:EdgeInsets.symmetric(vertical:30,horizontal:15),
                    child:ElevatedButton(
                      onPressed:(){
                        setState((){
                          _nameController.clear();
                          _idController.clear();
                          _departmentController.clear();
                          _phoneController.clear();
                        });
                      },
                      style:ElevatedButton.styleFrom(
                        foregroundColor:Colors.white,
                        backgroundColor:Colors.red
                      ),
                      child:const Text("Clear",
                        style:TextStyle(
                          fontSize:16,
                          fontWeight:.w800
                        )
                      )
                    )
                  ),

                  // Add_Button
                  Container(
                      height:50,
                      width:150,
                      margin:EdgeInsets.symmetric(vertical:30,horizontal:15),
                      child:ElevatedButton(
                          onPressed:()async{
                            if(_formKey.currentState!.validate()){
                              // _formKey.currentState!.save();

                              try{
                                await addEmployee();
                                await clear();
                              }catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error:$e"),
                                    backgroundColor:Colors.red,
                                    duration:Duration(
                                      seconds:3
                                    ),
                                    elevation:10,
                                    shape:RoundedRectangleBorder(
                                      borderRadius:BorderRadius.all(
                                        Radius.circular(20)
                                      )
                                    ),
                                    showCloseIcon:true,
                                    closeIconColor:Colors.white
                                  )
                                );
                              }
                            }
                          },
                          style:ElevatedButton.styleFrom(
                            foregroundColor:Colors.white,
                            backgroundColor:Colors.green
                          ),
                          child:const Text("Add",
                            style:TextStyle(
                              fontSize:16,
                              fontWeight:.w800
                            )
                          )
                      )
                  )
                ]
              )
            ]
          ),
        ),
      )
    );
  }
}
