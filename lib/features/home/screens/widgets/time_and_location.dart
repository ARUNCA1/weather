part of 'widgets.dart';

class TimeAndLocation extends StatefulWidget {
  const TimeAndLocation({
    super.key,
    this.date,
    this.cityName,
    this.temperature,
    this.weatherState,
    this.images,
    this.textColor,
    this.sunset


  });
  final String? date;
  final String? cityName;
  final String? temperature;
  final String? weatherState;
  final Color? textColor;
  final String? images;
  final int? sunset;

  @override
  State<TimeAndLocation> createState() => _TimeAndLocationState();
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Today ',];

    String dropdownValue = list.first;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("#AC736A"
          ),
          borderRadius: BorderRadius.circular(20),

        ),
        height: 383,
        width: 360,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
           // SizedBox(height: AppDimensions.height! * 0.021),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

    DropdownButton<String>(
    value: dropdownValue,
    icon: const Icon(Icons.arrow_drop_down),
    elevation: 16,
    style:  TextStyle(color: HexColor("#F6C8A4") ),
    underline: Container(

    ),
    onChanged: (String? value) {
    // This is called when the user selects an item.
    setState(() {
    dropdownValue = value!;
    });
    },
    items: list.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    )



              ],
            ),



            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherImage(
                  image: widget.images,
                ),
                Container(
                  width: 20,
                ),
                Text(
                  widget.temperature!,
                  style:   AppTypography.bold48(color: HexColor("#F6C8A4")),
                  overflow: TextOverflow.ellipsis,

                ),




              ],
            ),
            SizedBox(height: 30,),
            Text(
              widget.weatherState!,
              style: AppTypography.medium18(
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: 30,),
            Text(
              widget.cityName!,
              style: TextStyle(fontSize: 14,color: HexColor("#F6C8A4")),


            ),
            SizedBox(height: 30,),
            Text(
              widget.date!,
              style: TextStyle(fontSize: 14,color: HexColor("#F6C8A4")),

            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 "feel like 28"!,
                  style: TextStyle(fontSize: 14,color: HexColor("#F6C8A4")),
                ),
               Container(width: 20,child: Text("   |", style: TextStyle(fontSize: 14,color: HexColor("#F6C8A4")),
               ),),
                Text(
                  "sunset :"+widget.sunset.toString()!,
                  style: TextStyle(fontSize: 14,color: HexColor("#F6C8A4")),


                ),

                Container(
                  width: 20,
                ),





              ],
            ),

          ],
        ),
      ),
    );
  }
}
