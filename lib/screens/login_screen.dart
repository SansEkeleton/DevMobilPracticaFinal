import 'package:app_login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: AuthBackground(
 
        child: SingleChildScrollView(
        
          child: Column(
            
            children: [
              
              SizedBox(height: 200),
              CardContainer(
                
                child: Column(
                  
                  children: [
                    SizedBox(height: 10),
                    Text("Login", style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        labelText: "Email",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                        )
                      ),
                      validator: ( value ) => "Hola",
                    ),



                    SizedBox(height: 30),




                    TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: "Password",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                        )
                      ),
                    ),


                    SizedBox(height: 30),



                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 0,
                      color: Colors.deepPurple,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Text("Login", style: TextStyle(color: Colors.white))
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "Home");
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 50 ),
              Text("Create new account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ],
          )
        )
      ),
    );
    
  }
}
