part of 'widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.cityName,
    required this.time,
    required this.weatherState,
    required this.temperature,
    required this.image,
    required this.textColor,
    required this.sunset,
  });
  final String cityName;
  final String time;
  final String weatherState;
  final String temperature;
  final String image;
  final Color textColor;
  final int sunset;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeAndLocation(
              date: time,
              cityName: cityName,
              temperature: temperature,
              weatherState: weatherState,
              images: image,
              textColor: textColor,
              sunset: sunset,

            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(

                decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: HexColor("#AC736A")
                ),
                height: 150,
                  width: 360,
                  child: HourlyForecastScreen()),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 360,
                  child: Text("Random Text",style: TextStyle(color: Colors.white,fontSize: 18),)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,),
              child: Text("Experience weather like never before with our innovative Android application! Seamlessly blending precision data with an intuitive interface, our app delivers real-time weather updates, detailed forecasts, and immersive visuals, ensuring you stay one step ahead of Mother Nature. Embrace a new level of weather insight – where accuracy meets elegance."



              ),
            )
          ],
        ),
      ),
    );
  }
}
