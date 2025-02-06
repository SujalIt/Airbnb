import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/explore_expansion_tile_controller.dart';

class ExpansionTileExample extends StatelessWidget {
  // Instantiate the controller
  final ExploreExpansionTileController expansionTileController = Get.put(ExploreExpansionTileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Tile Open at a Time'),
      ),
      body: ListView(
        children: [
          // First ExpansionTile
          ExpansionTile(
            title: Text('Tile 1'),
            initiallyExpanded: expansionTileController.isExpanded1.value,
            onExpansionChanged: (isExpanded) {
              expansionTileController.isExpanded1.value = isExpanded;
              expansionTileController.handleExpansion(1, isExpanded);
            },
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('This is the content of Tile 1'),
              ),
            ],
          ),
          // Second ExpansionTile
          ExpansionTile(
            title: Text('Tile 2'),
            initiallyExpanded: expansionTileController.isExpanded2.value,
            onExpansionChanged: (isExpanded) {
              expansionTileController.isExpanded2.value = isExpanded;
              expansionTileController.handleExpansion(2, isExpanded);
            },
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('This is the content of Tile 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}