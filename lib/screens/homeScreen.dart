import 'package:flutter/material.dart';
// import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var temp;
  var desc;
  var humidity;
  var windSpeed;
  var currently;
  var city;

  Future getWeather() async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=bandung&units=imperial&appid=6f1149096d0cf64037e952bde9a20192';
    final response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);

    setState(() {
      this.temp = results['main']['temp'];
      this.desc = results['weather'][0]['description'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.currently = results['weather'][0]['main'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Currently in Bandung',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + '\u00B0' : 'Loading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currently != null ? currently.toString() : 'Loading',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ListTile(
                    leading: Icon(Icons.thermostat),
                    title: Text('Temperature'),
                    trailing: Text(
                        temp != null ? temp.toString() + "\u00B0" : 'Loading'),
                  ),
                  ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text('Weather'),
                    trailing: Text(desc != null ? desc.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Humidity'),
                    trailing: Text(
                        humidity != null ? humidity.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: Icon(Icons.air),
                    title: Text('Wind Speed'),
                    trailing: Text(
                        windSpeed != null ? windSpeed.toString() : "Loading"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
