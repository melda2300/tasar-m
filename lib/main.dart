import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formkey = GlobalKey<FormState>();
  String text = '';
  TextEditingController sifreController=TextEditingController();
  bool ?isChecked=true;
  bool isSwitched=false;
  double sliderValue=0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'İlk ödevim',
        home: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white54,
                appBar: AppBar(
                  backgroundColor: Colors.indigo,
                  title: Text("Hi-Kod",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffBDF5F2),
                        size: 40,
                      ),
                      onPressed: () {
                        print('İnsan ikonuna tıklandı!');
                      },
                    )
                  ],
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 40,
                      )),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        obscureText: true,
                        controller: sifreController,
                        onTap: () {
                          print('On tap fonksiyonuna tıklandı!');
                        },
                        onEditingComplete: () {
                          print('Yazı yazma işlemim tamamalandı!');
                        },
                        decoration: InputDecoration(
                          hintText: 'Lütfen şifrenizi giriniz.',
                          labelText: 'Şifre',
                          icon: Icon(Icons.password),
                          suffixIcon: Icon(Icons.account_box_outlined),
                          filled: false,
                          fillColor: Colors.blue,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue)),
                        ),
                        onChanged: (String _v) {
                          setState(() {
                            text = _v;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: Text(text),
                    ),
                    Container(
                      child: Text(sifreController.text),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      checkColor: Colors.black,
                      side: BorderSide(color: Colors.indigo,width: 15),
                      tristate: true,
                      value:isChecked ,
                      onChanged: (_checked){
                        setState(() {
                          isChecked=_checked;
                          print(isChecked);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CheckboxListTile(
                        title: Text('CheckBox Listile '),
                        subtitle: Text('subtitle'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.teal,
                        value: isChecked, onChanged: (_checked){
                        setState(() {
                          isChecked=_checked;
                          print(isChecked);
                        });
                      },),


                    ),
                    Switch(
                        activeColor: Colors.black,
                        value: isSwitched, onChanged: (_newValue){
                      setState(() {
                        isSwitched=_newValue;
                        print(isSwitched);
                      });
                    }),

                    SwitchListTile(
                        title: Text('Switch Listile ',style: TextStyle(color:Colors.deepOrange),),
                        subtitle: Text('subtitle'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.teal,
                        value: isSwitched, onChanged: (_newValue){
                      setState(() {
                        isSwitched=_newValue;
                        print(isSwitched);
                      });
                    }),

                    Visibility(
                      visible: isSwitched,
                      child: Slider(value: sliderValue,
                        onChanged: (double value) { setState(() {
                          sliderValue=value;
                        }); },
                        min:0,
                        max:10,
                        divisions: 10,
                        label: sliderValue.round().toString(),

                      ),
                    ),

                  ],
                )
            )
        )
    );
  }
}