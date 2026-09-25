import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final txtPwd = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
      obscureText: true,
    );

    final loading = Positioned(
      top: 150,
      child: CircularProgressIndicator(
      )
    );

    final btnLogin = ElevatedButton(
      onPressed: (){
        isLoading = !isLoading;
        setState((){});
        Future.delayed(
          Duration(seconds: 4)
        ).then((value){
          Navigator.pushNamed(context, "/dash");
          isLoading = false;
          setState(() {});
          }
        );
      },
      child: Row(
        children: [
          Icon(Icons.login),
          Text("Iniciar sesion")
        ],
      )
    );

    final space = Container(height: 5);
    final space2 = SizedBox(height: 5);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/halo_anillo.jpg'),
          )
        ),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset('assets/halo_casco.png', height: 220),
              Positioned(
                bottom: 50,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x99FFFFFF)
                  ),
                  child: Column(
                    children: [
                      txtUser,
                      Divider(),
                      txtPwd,
                      space2,
                      btnLogin
                    ]
                  )
                )
              ),
              isLoading ? loading : Container()
          ],
        )
      )
    );
  }
}