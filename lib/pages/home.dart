import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime']?'day.png':'night.png';
    Color? bgColor = data['isDaytime']?Color(0xFF5DBBD5):Color(0xFF141834);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'flag': result['flag'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text('Edit Location'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
