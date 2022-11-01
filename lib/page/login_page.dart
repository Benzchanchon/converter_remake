import 'package:flutter/material.dart';

import '../untils/converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<HomePage> {
  var _feedbackText = '';
  final _controller = TextEditingController(); //อ่านค่าจากTextField
  void _handleclick(int i){
    var input = _controller.text;  //รับมาเป็นสตรืง
    if(input==''){
      setState(() {
        _feedbackText = "ใส่ก่อนนะ";
      });
      return;
    }
    var temp = double.tryParse(input); //แปลงสตริงเป็นดับเบิล
    if(temp==null){
      setState(() {
        _feedbackText = "ใส่เลขดิน้อง";
      });
      return;
    }
    switch(i){
      case 1:
        //C TO F
        setState(() {
          _feedbackText = "$temp Cเท่ากับ ${MyConverter.C2F(temp)}F";
        });
        break;
      case 2:
      //C TO K
        setState(() {
          _feedbackText = "$temp Cเท่ากับ ${MyConverter.C2K(temp)}Kะ";
        });
        break;
      case 3:
      //F TO C
        setState(() {
          _feedbackText = "$temp Fเท่ากับ ${MyConverter.F2C(temp)}C";
        });
        break;
      case 4:
      //F TO K
        setState(() {
          _feedbackText = "$temp Fเท่ากับ ${MyConverter.F2K(temp)}K";
        });
        break;
      case 5:
      //K TO C
        setState(() {
          _feedbackText = "$temp Kเท่ากับ ${MyConverter.K2C(temp)}C";
        });
        break;
      case 6:
      //K TO F
        setState(() {
          _feedbackText = "$temp Kเท่ากับ ${MyConverter.K2F(temp)}F";
        });
        break;
    }
  }
  Widget _buildButton(String msg,int i){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed:(){
            _handleclick(i);
            },
          child: Text(msg)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('TC',style: TextStyle(fontSize: 40)),
            Container(
              margin: EdgeInsets.all(20.0), //ใส่ขอบ
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepPurple.shade200,
                ),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0,3),
                  ),
                ],
              ),
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        textAlign: TextAlign.center, //ให้เริ่มพิมพ์ตรงกลาง
                        controller: _controller, //ค่าในข้อความ:ชื่อตัวแปร
                        style: TextStyle(   //กำหนดขนาด
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("C to F",1),
                        _buildButton("C to K",2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("F to C",3),
                        _buildButton("F to K",4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("K to F",5),
                        _buildButton("K to C",6),
                      ],
                    ),
                  ],
              ),
            ),
            Text(_feedbackText,style: TextStyle(fontSize: 40),)
          ],
        ),
      ),
    );
  }
}
