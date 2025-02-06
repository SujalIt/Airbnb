import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreCarouselSliderController extends GetxController{
  var currentIndex = 0.obs;
  final List<Widget> images = [
    Image.network(
      'https://www.smartextpros.com/wp-content/uploads/2024/07/horizontal-vs-vertical-siding-01.jpg',
      fit: BoxFit.cover,
    ),
    Image.network(
        'https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg?cs=srgb&dl=pexels-fotoaibe-1643383.jpg&fm=jpg',
      fit: BoxFit.cover,
    ),
    Image.network(
        'https://c4.wallpaperflare.com/wallpaper/724/723/644/interior-design-room-house-home-apartment-condo-209-desktop-background-images-wallpaper-preview.jpg',
      fit: BoxFit.cover,
    )
  ];
}