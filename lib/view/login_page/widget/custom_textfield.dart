import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String labeltext;
  final IconData? icon;
  const Mytextfield(
      {super.key, this.controller, required this.labeltext, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 65,
        width: 350,
        child: TextFormField(
          maxLength: 8,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
          
              contentPadding: const EdgeInsets.only(top: 15, left: 6),

              // border:
              //     OutlineInputBorder(),
              labelText: labeltext,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(icon),
                color: Colors.deepPurple,
              ),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              fillColor: Colors.black),
        ),
      ),
    );
  }
}

class EmailTexfild extends StatelessWidget {
  final controller;
  final String labeltext;
  final IconData? icon;
  const EmailTexfild(
      {super.key, this.controller, required this.labeltext, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 65,
        width: 350,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your E-mail';
            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return 'invalid emil';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          maxLength: 18,
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 15, left: 6),
              // border:
              //     OutlineInputBorder(),
              labelText: labeltext,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(icon),
                color: Colors.deepPurple,
              ),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              fillColor: Colors.black),
        ),
      ),
    );
  }
}
