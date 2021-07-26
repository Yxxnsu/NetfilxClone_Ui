import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {

  final Content featuredContent;
  
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            )
          ),         
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],     
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,     
            )
          ),         
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('List'),
              ),
              _playButton(),
               VerticalIconButton(
                icon: Icons.add,
                title: 'Info',
                onTap: () => print('MY Info'),
              )
            ],
          ),
        )
      ],
    );
  }

  _playButton(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      child: TextButton.icon(      
        icon: Icon(Icons.play_arrow,size: 30,),
        label: Text(
          'Play',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )
        ),
        onPressed: (){},
      ),
    );      
  }
}
