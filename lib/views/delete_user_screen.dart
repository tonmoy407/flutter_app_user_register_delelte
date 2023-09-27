import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DeleteUserScreen extends StatefulWidget {
  const DeleteUserScreen({super.key});

  @override
  State<DeleteUserScreen> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends State<DeleteUserScreen> {


  TextEditingController deleteUserName = TextEditingController();
  String deleteUsername = "";
  int succesCheck = 0;
  @override
  Widget build(BuildContext context) {
    void _showToastSucces(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('User Deleted'),
        ),
      );
    };
    void _showToastFailed(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Can not deleted'),
        ),
      );
    };
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: deleteUserName,
              decoration: InputDecoration(
                label: const Text("Enter first name of the user"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            ),
            const SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                deleteUsername = deleteUserName.text;
                print(deleteUsername);
                Future<void> deleteUserAPI () async {
                  var response = await http.delete(Uri.parse("http://192.168.0.105:3000/api/users/${deleteUsername}"));
                  print(response.body);
                  if(response.statusCode == 200){
                    succesCheck = 1;
                    _showToastSucces(context);
                  }else{
                    succesCheck = 0;
                    _showToastFailed(context);
                  }

                };
                deleteUserAPI();
                setState(() {

                });
              },
              child: Container(
                child: Text("Delete",style: TextStyle(fontSize: 25),),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
