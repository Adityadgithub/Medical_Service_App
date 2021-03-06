import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';
void main() {
runApp(doctorbutton());
}

class doctorbutton extends StatefulWidget {
  const doctorbutton({ Key? key }) : super(key: key);
  @override
  State<doctorbutton> createState() => _doctorbuttonState();
}
class _doctorbuttonState extends State<doctorbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: () {
              loginas = "Doctor";
              Navigator.pushNamed(context, "login");
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/doctor.png",
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Doctor",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }
}