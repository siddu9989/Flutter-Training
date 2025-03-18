import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_login/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _value = 0;
  TextEditingController nameCon = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController addCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 173, 74),
        title: Text("Student Registration"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          width: 500,
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(16.0),
          color: const Color.fromARGB(255, 231, 225, 212),
          child: Column(
            children: [
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
                ],
                controller: nameCon,
                validator: (nameCon) {
                  if (nameCon == null || nameCon.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 164, 84),
                      width: 2.0,
                    ),
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                  ),
                  hintText: "Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(width: 20.0,),
              
          
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 218, 164, 84),
                    width: 2.0
                    
                  )
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = (value)!;
                        });
                      },
                    ),
                    Text("Male"),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  SizedBox(width: 30.0),
                  Text("Female"),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 164, 84),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.date_range),
                  ),
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: emailCon,
                validator: (emailCon) {
                  if (emailCon == null || emailCon.isEmpty) {
                    return "Please enter your email id";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 164, 84),
                      width: 2.0,
                    ),
                  ),
                  hintText: "Your email id",
                  labelText: "Email",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.email_rounded),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),

              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ],
                controller: phoneCon,
                validator: (phoneCon) {
                  if (phoneCon == null || phoneCon.isEmpty) {
                    return "Please enter the valid number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 164, 84),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.phone),
                  ),
                  hintText: "Enter 10 digits",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: addCon,
                validator: (addCon) {
                  if (addCon == null || addCon.isEmpty) {
                    return "Please enter your email id";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 164, 84),
                      width: 2.0,
                    ),
                  ),
                  hintText: "Enter Your Address",
                  labelText: "Address",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_city),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 239, 173, 74),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
              child: Text(
                "SUBMIT",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
