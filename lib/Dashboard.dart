import 'package:bs_tek/login.dart';
import 'package:flutter/material.dart';

import 'Doctor_List.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Future<void> _signOut() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Sign Out'),
        content: Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('No'),
          ),
          TextButton(
            // onPressed: () => Navigator.pop(context, true),

            onPressed: () {
              Navigator.pop(context, true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),

              );

            },

            child: Text('Yes'),
          ),
        ],
      ),
    );

  }
  List a = [
    'picture/img_1.png',
    'picture/img_2.png',
    'picture/img_3.png',
    'picture/img_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon(
                //   Icons.menu,
                //   color: Colors.white,
                //   size: 30,
                // ),
                // IconButton(onPressed: (){
                //   Scaffold.of(context).openDrawer();
                // }, icon: Icon(Icons.menu_outlined)),
                SizedBox(
                  width: 250,
                ),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("picture/logo.jpeg"),
                        fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            Text(
              "Welcome Back",
              style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Let's Book the ",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Appointment",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Search Categories...",
              ),
            )
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent.shade400,
        toolbarHeight: 280,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header', style: TextStyle(color: Colors.white, fontSize: 24,
              ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('SignOut'),
              trailing: ElevatedButton(
                onPressed: _signOut,
                child: const Text("Sign Out"),
              ),
              onTap: () {
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Catogories",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height:10,),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(a[index]), fit: BoxFit.cover)),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "     Top Doctors",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "All  >   ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              width: 380,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext con, index) {
                    return GestureDetector(
                        onTap: ()=>{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const doctor_list())),
                        },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 100,
                            width: 350,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dr. John",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      // Text("Heart Specialist",style: TextStyle(color: Colors.blue),)
                                      Container(
                                        height: 25,
                                        width: 140,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.orangeAccent,
                                        ),
                                        child: Text("7 am - 7pm",
                                            style:
                                            TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Senior Doctor",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}