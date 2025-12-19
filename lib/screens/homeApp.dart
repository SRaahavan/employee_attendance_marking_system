import "package:flutter/material.dart";
import "package:employee_attendance/screens/employeeApp.dart";
import "package:cloud_firestore/cloud_firestore.dart";


class homeApp extends StatefulWidget {
  const homeApp({super.key});

  @override
  State<homeApp> createState() => _homeAppState();
}

class _homeAppState extends State<homeApp> {

  int x = 1;
  Map <String,dynamic> checkboxState = {};
  List<Map<String,dynamic>> allUsers = [];
  List <Map<String,dynamic>> displayUsers = [];
  String currentSearchKeyword = "";

  @override
  initState(){
    super.initState();
  }

  void _runFilter(String enteredKeyWord){
    currentSearchKeyword = enteredKeyWord;
    List<Map<String,dynamic>> results = [];
    if(enteredKeyWord.isEmpty){
      results = allUsers;
    }else{
      results = allUsers
          .where((user) => user["name"].toLowerCase().contains(enteredKeyWord.toLowerCase()))
          .toList();
    }

    setState((){
      displayUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar:AppBar(
        backgroundColor:Colors.green,
        title:const Text("Welcome",
          style:TextStyle(
            color:Colors.white,
            fontSize:28,
            fontWeight:.w800
          )
        ),
        centerTitle:true
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment:.center,
            children: [
              Column(
                mainAxisAlignment:.start,
                children:[
                  SizedBox(
                    width:MediaQuery.of(context).size.width * 0.95,
                    child:Column(
                      mainAxisAlignment:.start,
                      children:[
        
                        Padding(
                          padding: const EdgeInsets.only(top:15.0,bottom:30),
                          child: SizedBox(
                            // width:MediaQuery.of(context).size.width * 0.9,
                            child: SearchBar(
                              trailing:[
                                Icon(
                                  Icons.search,
                                  size:25
                                )
                              ],
                              onChanged:(value) => _runFilter(value)
                            ),
                          ),
                        ),
        
                        Container(
                          height:MediaQuery.of(context).size.height * 0.61,
                          width:MediaQuery.of(context).size.width * 0.95,
                          decoration:BoxDecoration(
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:StreamBuilder<QuerySnapshot>(
                              stream:FirebaseFirestore.instance.collection("employee").snapshots(),
                              builder:(context,snapshot){

                                if(snapshot.hasError){
                                  return Center(
                                    child:Text("Error: ${snapshot.error}")
                                  );
                                }

                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child:CircularProgressIndicator(
                                      color:Colors.blue
                                    )
                                  );
                                }

                                if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                                  return Center(
                                    child:Column(
                                      mainAxisAlignment:.center,
                                      children:[
                                        Icon(
                                          Icons.person_off_outlined,
                                          color:Colors.grey,
                                          size:80
                                        ),
                                        SizedBox(height:80),
                                        const Text("No employee found",
                                        style:TextStyle(
                                          color:Colors.grey,
                                          fontSize:25,
                                          fontWeight:.w600
                                        ))
                                      ]
                                    )
                                  );
                                }

                                List<Map<String,dynamic>> employeeData = snapshot.data!.docs.map((doc){
                                  Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
                                  data["docId"] = doc.id;

                                  if(!checkboxState.containsKey(doc.id)){
                                    checkboxState[doc.id] = false;
                                  }
                                  return data;
                                }).toList();

                                allUsers = employeeData;
                                if(currentSearchKeyword.isEmpty){
                                  displayUsers = allUsers;
                                }else{
                                  displayUsers = allUsers
                                      .where((user) => user["name"].toString().toLowerCase().contains(currentSearchKeyword.toLowerCase()))
                                      .toList();
                                }

                                return displayUsers.isEmpty
                                    ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search_off,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "No results found",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                ) : ListView.builder(
                                  padding:EdgeInsets.all(10),
                                  itemCount:displayUsers.length,
                                  itemBuilder:(context,index){
                                    Map<String,dynamic> employee = displayUsers[index];
                                    return Card(
                                      elevation:5,
                                      margin:EdgeInsets.all(10),
                                      shape:RoundedRectangleBorder(
                                        borderRadius:BorderRadius.all(
                                          Radius.circular(20)
                                        )
                                      ),
                                      child:Container(
                                        height:120,
                                        padding:EdgeInsets.all(10),
                                        decoration:BoxDecoration(
                                          color:Colors.black.withOpacity(0.1),
                                          backgroundBlendMode:BlendMode.darken,
                                          borderRadius:BorderRadius.all(Radius.circular(20))
                                        ),
                                        child:Stack(
                                          children:[
                                            Positioned(
                                              top:10,
                                              left:10,
                                              child:Text(employee["name"],
                                                style:TextStyle(
                                                  fontSize:22,
                                                  fontWeight:.w600
                                                )
                                              )
                                            ),
                                            Positioned(
                                              top:40,
                                              left:10,
                                              child:Text("Employee ID: ${employee["id"]}",
                                                style:TextStyle(
                                                  fontSize:12
                                                )
                                              ),
                                            ),
                                            Positioned(
                                              top:55,
                                              left:10,
                                              child:Text("Department: ${employee["department"]}",
                                                style:TextStyle(
                                                  fontSize:12
                                                )
                                              )
                                            ),
                                            Positioned(
                                              top:70,
                                              left:10,
                                              child:Text("phone: ${employee["phone"]}",
                                                style:TextStyle(
                                                  fontSize:12
                                                )
                                              )
                                            ),
                                            Positioned(
                                              bottom:20,
                                              right:10,
                                              child:Checkbox(
                                                value: checkboxState[employee["name"]] ?? false,
                                                onChanged: (bool? value) {
                                                  setState((){
                                                    checkboxState[employee["name"]] = value ?? false;
                                                  });
                                                  if(value==true){
                                                    try{
                                                      FirebaseFirestore.instance
                                                      .collection("employee")
                                                      .doc(employee["name"])
                                                      .collection("attendance")
                                                      .doc("attempt${x++}")
                                                      .set({
                                                        "time":DateTime.now()
                                                      });
                                                    }catch(e){
                                                      print ("Error:$e");
                                                    }
                                                  }

                                                },
                                                checkColor:Colors.white,
                                                activeColor:Colors.green,
                                                shape:RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.all(
                                                    Radius.circular(30),
                                                  )
                                                ),
                                              )
                                            )
                                          ]
                                        )
                                      )
                                    );
                                  }
                                );

                              }
                            )
                          )
                        ),
        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:10),
                          child: SizedBox(
                            width:MediaQuery.of(context).size.width * 0.6,
                            height:50,
                            child: ElevatedButton(
                                onPressed:(){
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>employeeApp()));
                                },
                                style:ElevatedButton.styleFrom(
                                    backgroundColor:Colors.blue,
                                    foregroundColor:Colors.white
                                ),
                                child:const Text("+  Add Employee",
                                    style:TextStyle(
                                        fontSize:18
                                    )
                                )
                            ),
                          ),
                        ),
                      ]
                    )
                  )
                ]
              ),
            ],
          ),
        ),
      )
    );
  }
}
