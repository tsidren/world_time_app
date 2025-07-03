import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(urlparam: 'Europe%2FLondon', location: 'London', flag: 'uk.png'),
    WorldTime(urlparam: 'Europe%2FBerlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlparam: 'Africa%2FCairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlparam: 'Africa%2FNairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlparam: 'America%2FChicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlparam: 'America%2FNew_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlparam: 'Asia%2FKolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(urlparam: 'Asia%2FJakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
              ),
            ),
          );
        }
      ),
    );
  }
}
