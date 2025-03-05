import 'package:airbnb/airbnb_global_imports.dart';

class CustomCliprrectBedroomParticularHome extends StatelessWidget{
  const CustomCliprrectBedroomParticularHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.screenHeight * 0.13,
          width: context.screenWidth * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmVkcm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D'),
          ),
        ),
        Text('Bedroom 2'),
        Text('1 queen bed'),
      ],
    );
  }

}