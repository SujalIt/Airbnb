import '/airbnb_global_imports.dart';

class FullScreenMapDialog extends StatelessWidget {
  const FullScreenMapDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(23.014509, 72.591759),
              zoom: 12,
            ),
            zoomControlsEnabled: false,
          ),
          Positioned(
            top:  context.screenHeight * 0.055  ,
            right: context.screenWidth * 0.043,
            child: IconButton(
              iconSize: context.screenWidth * 0.08,
              icon: Icon(Icons.close, color: Colors.black,),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}