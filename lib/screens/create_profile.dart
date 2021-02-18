import 'package:clinkoin/main.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  static final routeName = '/CreateProfile';
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          )),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Create Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top) *
              .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What should we call you?',
                  style: TextStyle(
                    fontSize: MyApp.eighteen,
                  ),
                ),
              ),
              TextFormField(
                autofocus: true,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(41, 114, 255, 1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withAlpha(80),
                      width: 0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(41, 114, 255, 1), width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                height: 40,
                child: RaisedButton(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromRGBO(41, 114, 255, 1),
                  onPressed: () {},
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
