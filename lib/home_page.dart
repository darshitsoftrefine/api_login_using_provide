import 'package:api_through_provide/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String baseUrl = 'https://coupinos-app.azurewebsites.net';
  bool onClick = false;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<Api_Provider>(context, listen: false).getAllDetails();
      Provider.of<Api_Provider>(context, listen: false).getAllAdrDetails();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider API"),
      ),
      body: onClick?
      Consumer<Api_Provider>(
        builder: (context, value, child) {
       return  Padding(
         padding: const EdgeInsets.all(10.0),
         child: Center(
           child: Column(
             children: [
               Container(
                 child:  CircleAvatar(
                   backgroundColor: Colors.black,
                   radius: 150,
                   child: CircleAvatar(
                     radius: 115,
                     backgroundImage: NetworkImage(baseUrl+'${value.contDetail?.profilePic}'),
                   ),
                 ),
                 // Image.network(baseUrl+'${contDetails!.profilePic}'),
                 width: 100,
                 height: 100,
               ),
               SizedBox(height: 10,),
               Text('Name: '+'${value.contDetail?.firstName}'+ " "+'${value.contDetail!.lastName}', style: TextStyle(fontSize: 20),),
               SizedBox(height: 10,),
               Text('E-Mail Id: '+'${value.contDetail!.email}', style: TextStyle(fontSize: 20),),
               SizedBox(height: 10,),
               Text('Gender: '+'${value.contDetail!.gender}', style: TextStyle(fontSize: 20),),
               SizedBox(height: 10,),
               Text('Date of Birth: '+'${value.contDetail!.dob!.day}'+'/'+'${value.contDetail!.dob!.month}'+'/'+'${value.contDetail!.dob!.year}', style: TextStyle(fontSize: 20),),
               SizedBox(height: 10,),
             ],
           ),
         ),
       );

      },
      ): Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              onClick = true;
            });
          },
          child: const Text('Click Here to see the Contact Details'),
        ),
      )
    );
  }
}
