import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/model.dart';

class Services {
  //late List<ContactPerson> contDetails;
  ContactPerson? contDetails;
  Address? adrDetails;
  Future<ContactPerson?> postContactDetails() async {
    final response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'learntest43+1@gmail.com',
        'password': 'Test@123',
      }),
    );

    // Convert the Dart object into a list.
    //var list = List.from(dartObject);
    var data = jsonDecode(response.body);
    print(data['contactPerson']);
    if (response.statusCode == 200) {
      // for (Map<String, dynamic> index in data) {
      contDetails = ContactPerson.fromJson(data['contactPerson']);
      print(contDetails!.firstName);
      //contDetails = List.from(data['contactPerson']);
      //List<ContactPerson> contactPersons = contDetails!.map((map) => ContactPerson.fromJson(map as Map<String, dynamic>)).toList();
      // contactPersons.add(contDetails as ContactPerson);
       //print(contactPersons);
      return contDetails;
    } else {
      return contDetails;
    }
  }

  Future<Address?> postAddressDetails() async {
    final response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'learntest43+1@gmail.com',
        'password': 'Test@123',
      }),
    );

    // Convert the Dart object into a list.
    //var list = List.from(dartObject);
    var data = jsonDecode(response.body);
    print(data['address']);
    if (response.statusCode == 200) {
      // for (Map<String, dynamic> index in data) {
      adrDetails = Address.fromJson(data['address']);

      //contDetails = List.from(data['contactPerson']);
      //List<ContactPerson> contactPersons = contDetails!.map((map) => ContactPerson.fromJson(map as Map<String, dynamic>)).toList();
      // contactPersons.add(contDetails as ContactPerson);
      //print(contactPersons);
      return adrDetails;
    } else {
      return adrDetails;
    }
  }
}