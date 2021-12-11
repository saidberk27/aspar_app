import 'package:flutter/material.dart';

class InputAlan extends StatefulWidget {
  String? tur;
  InputAlan(this.tur, {Key? key}) : super(key: key);

  @override
  State<InputAlan> createState() => InputAlanState();
}

class InputAlanState extends State<InputAlan> {
  late TextEditingController _emailKontroller = TextEditingController();
  late TextEditingController _sifreKontroller;

  @override
  void initState() {
    super.initState();
    _emailKontroller = TextEditingController();
    _sifreKontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailKontroller.dispose();
    _sifreKontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tur == "email") {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: TextFormField(
          controller: _emailKontroller,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: "E - Mail",
              hintText: "E-Mail",
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ),
      );
    } else if (widget.tur == "sifre") {
      return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
        child: TextFormField(
          controller: _sifreKontroller,
          obscureText: true,
          decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Password",
              prefixIcon: Icon(Icons.password_sharp),
              suffixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: TextFormField(
          decoration: const InputDecoration(
              labelText: "E - Mail",
              hintText: "E-Mail",
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ),
      );
    }
  }
}
