part of '../../features/home/screens/widgets/widgets.dart';

class WeatherImage extends StatefulWidget {
  final String? image;

  const WeatherImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  _WeatherImageState createState() => _WeatherImageState();
}

class _WeatherImageState extends State<WeatherImage>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();






  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/Vector.png",height: 72,
        width: 95,
        fit: BoxFit.cover,
      ),
    );
  }


}
