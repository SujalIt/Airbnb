import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/explore_expansion_tile_controller.dart';

class StartYourSearch extends StatelessWidget {
   const StartYourSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreExpansionTileController expansionTileController = Get.find();
      return Column(
        children: [
          SizedBox(height: 50,),
          DefaultTabController(length: 2,
              child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: 'Stays',),
                    Tab(text: 'Experiences',)]
              )),
          // Where !!
          Card(
            child: ExpansionTile(
              key: Key('0'),
                  trailing: Text(''),
                  title: Text('Where to?'),
                  initiallyExpanded: false,
                  onExpansionChanged: (expanded){
                    print('hello : ${Key('0')}'); // not working...
                    if(expanded){
                      false;
                    }else{
                      true;
                    }
                  },
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search destinations',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Ahmedabad,Gujarat'),
                              subtitle: Text('For its intelligence!'),
                              leading: Icon(Icons.location_city_outlined),
                            );
                          }),
                    )
                  ]
                ),
              ),
          // When !!
          Card(
              child: ExpansionTile(
                    title: Text('When'),
                    trailing: Text('Any week'),
                    initiallyExpanded: false,
                    onExpansionChanged: (expanded){

                    },
                    children: [
                      Text('DSA')
                    ]),
            ),
          // Who !!
          Card(
            child: ExpansionTile(
                  title: Text('Who'),
                  trailing: Text('Add guests'),
                  children: [
                    ListTile(
                      title: Text('Adults'),
                      subtitle: Text('Ages 13 or above'),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle_outline)),
                        Text('0', style: TextStyle(fontSize: 28),),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline))
                      ],),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Children'),
                      subtitle: Text('Ages 2-12'),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle_outline)),
                        Text('0', style: TextStyle(fontSize: 28),),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline))
                      ],),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Infants'),
                      subtitle: Text('Under 2'),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle_outline)),
                        Text('0', style: TextStyle(fontSize: 28),),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline))
                      ],),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Pets'),
                      subtitle: Text('Bringing a service animal?'),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle_outline)),
                        Text('0', style: TextStyle(fontSize: 28),),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline))
                      ],),
                    )
                  ]),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Clear all'),
              ElevatedButton.icon(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
                ),
                label: Text('Search'),),
            ],)
        ],
      );
  }
}