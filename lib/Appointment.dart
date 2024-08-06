import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime? selectedDate;
  int selectedbox=-1;
  int selectedIndex= -1;
  List list=[
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
  ];

  List month=[
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List time=[
    "7 AM",
    "8 AM",
    "9 AM",
    "10 AM",
    "7 PM",
    "8 PM",
    "9 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              leading: Icon(Icons.menu_outlined,color: Colors.white,),
              title: Text("Appointment",style: TextStyle(color: Colors.white),),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("picture/logo.jpeg"),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 90,
                width:MediaQuery.of(context).size.width ,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("Dr.John",
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("Heart Specialist",
                      style: TextStyle(color: Colors.blue,fontSize: 20,),),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Schedules",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 200,),
                Text("August",style: TextStyle(color: Colors.black54,fontSize: 20),),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            Container(
              height: 110,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext c ,index)
                  {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedbox=index;
                        });
                      },
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                color: selectedbox == index ? Colors.deepPurpleAccent : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: selectedbox == index ? Colors.blue : Colors.black),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(list[index],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: selectedbox == index ? Colors.white : Colors.black,),),
                                  Text(month[index],style: TextStyle(fontSize: 15,color: selectedbox == index ? Colors.white : Colors.black,),)
                                ],
                              ),

                            ),
                          ),


                        ],
                      ),
                    );
                  }
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Visit Hours",style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold) ,),
                ),
              ],
            ),
            Container(
              height: 90,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: time.length,
                  itemBuilder: (BuildContext c ,index)
                  {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex = index; // Update the selected index
                        });
                      },
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: selectedIndex == index ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: selectedIndex == index ? Colors.blue : Colors.black),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(time[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: selectedIndex == index ? Colors.white : Colors.black,),),

                                ],
                              ),

                            ),
                          ),


                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Patient",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Enter the Mobile Number"
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 130,
                    color: Colors.white,
                    child: Center(child: Text("MRD23")),
                  ),
                ),
                SizedBox(

                  child: Container(
                    height: 50,
                    width: 300,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text("       John Smith"),
                        SizedBox(width: 15,),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),

                          child: TextButton(onPressed: (){},
                            child: Text("Select",
                              style: TextStyle(color: Colors.white),),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 130,
                    color: Colors.white,
                    child: Center(child: Text("MRD23")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text("       William"),
                        SizedBox(width: 15,),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),

                          child: TextButton(onPressed: (){},
                            child: Text("Select",
                              style: TextStyle(color: Colors.white),),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: 390,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Your appointment was confirmed'),
                    ),
                  );
                },
                child: Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}