import 'package:flutter/material.dart';

void main(){
    runApp(
        MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
            title: Text(
                'Weather App',
                style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                ),
            ),
            backgroundColor: const Color.fromARGB(255, 108, 187, 250),
            flexibleSpace: Container(
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                child: Icon(
                Icons.menu,
                color: Colors.white,
                ),
            ),
            ),
            body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
                children: [
                WeatherCard(
                    weather: Weather.cloudy,
                    city: "Phnom Penh",
                    temp: "12.2",
                    min: "10.0",
                    max: "30.0",
                ),

                const SizedBox(height: 20),
                WeatherCard(
                    weather: Weather.sunnyCloudy,
                    city: "Paris",
                    temp: "22.2",
                    min: "10.0",
                    max: "40.0",
                ),
                const SizedBox(height: 20),

                WeatherCard(
                    weather: Weather.sunny,
                    city: "Rome",
                    temp: "45.2",
                    min: "10.0",
                    max: "40.0",
                ),
                const SizedBox(height: 20),

                WeatherCard(
                    weather: Weather.veryCloudy,
                    city: "Toulouse",
                    temp: "45.2",
                    min: "10.0",
                    max: "40.0",
                ),
                ],
            ),
            ),
        ),
        )
    );
}

class WeatherCard extends StatelessWidget {
    final Weather weather;
    final String city;
    final String min;
    final String max;
    final String temp;

    const WeatherCard({
        super.key,
        required this.weather,
        required this.city,
        required this.min, 
        required this.max, 
        required this.temp, 
    });

    @override
    Widget build(BuildContext context) {
        return PhysicalModel(
        clipBehavior: Clip.hardEdge,
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 6,
        child: Container(
            decoration: BoxDecoration(gradient: weather.gradient),
            child: Stack(
            children: [
                Positioned(
                right: -55,
                top: -20,
                child: CircleAvatar(
                    radius: 85,
                    child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: weather.gradient
                    ),
                    ),
                ),
                ),       
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    // weather icon
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        child: Image(
                        image: AssetImage(weather.image),
                        width: 50,
                        ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            city,
                            style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        Text(
                            "Min $min˚C",
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                            "Max $max˚C",
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        ],
                    ),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                        "$temp˚C",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }

    enum Weather {
    cloudy(
        'lib/Week5/assets/ex4/cloudy.png',
        LinearGradient(
        colors: [
            Color.fromARGB(255, 155, 119, 254),
            Colors.purple,
        ],
        ),
    ),

    sunny(
        'lib/Week5/assets/ex4/sunny.png',
        LinearGradient(
        colors: [
            Color.fromARGB(255, 246, 99, 148),
            Colors.orange,
        ],
        ),
    ),

    sunnyCloudy(
        'lib/Week5/assets/ex4/sunnyCloudy.png',
        LinearGradient(
        colors: [
            Color.fromARGB(255, 134, 250, 223),
            Colors.green,
        ],
        ),
    ),

    veryCloudy(
        'lib/Week5/assets/ex4/veryCloudy.png',
        LinearGradient(
        colors: [
            Color.fromARGB(255, 242, 168, 90),
            Colors.yellow,
        ],
        ),
    );

    final String image;
    final LinearGradient gradient;

    const Weather(this.image, this.gradient);
}