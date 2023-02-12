import 'package:flutter/material.dart';

class patient_or_doctor extends StatelessWidget {
  const patient_or_doctor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.indigo),
              onPressed: () {
                Navigator.pushNamed(context, '/patient');
              },
              child: Text('Patient'),
            ),
            SizedBox(height: 20),
            TextButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.indigo),
              onPressed: () {
                Navigator.pushNamed(context, '/doctor');
              },
              child: Text('Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}