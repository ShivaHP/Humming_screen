import 'package:flutter/material.dart';
import 'package:humming_assignment/UI/home.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                color: Colors.grey.shade200,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border:
                          Border.all(width: 2, color: Colors.orange.shade900),
                      image: DecorationImage(
                          image: NetworkImage(
                              NewsModelContent.newsmodel[0].imageUrl),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .185,
                  left: MediaQuery.of(context).size.width * .34,
                  child: Text(
                    "Narendra Modi",
                    style: TextStyle(
                        color: Colors.orange.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * .23,
                left: MediaQuery.of(context).size.width * .38,
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade100,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.orange.shade900,
                        ),
                      )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      //labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),
                      //labelText: "$text",
                      hintText:
                          "******************************************************************************************************",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                    )),
                mytextform("Pincode", '*******'),
                mytextform("Date of Birth", "dd-mm-yy"),
                mytextform("Gender", "Male"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Whatsapp",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("+91 - "),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "xxxxxxxxxxxxxxxxxxxx",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black)),
                    ))
                  ],
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                mytextform("Email", "xxxxxxxxxxxxx@gmail.com"),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget mytextform(String text, String hintext) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                //labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),
                //labelText: "$text",
                hintText: " $hintext",
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              ))
        ],
      ),
    );
  }
}
