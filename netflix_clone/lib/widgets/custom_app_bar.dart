import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/responsive.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  
  final double scrollOffset;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(mobile: mobileAppBar(), desktop: webAppBar()),
    );
  }

  Widget mobileAppBar() {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          SizedBox(width:12),       
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'TV Shows',onTap: ()=> print('TV Shows')),
                _AppBarButton(title: 'Movies',onTap: ()=> print('Movies')),
                _AppBarButton(title: 'My List',onTap: ()=> print('My List')),
              ],
            ),
          ),     
        ],  
      ),
    );
  }

  Widget webAppBar() {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          SizedBox(width:12),       
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home',onTap: ()=> print('Home')),
                _AppBarButton(title: 'TV Shows',onTap: ()=> print('TV Shows')),
                _AppBarButton(title: 'Movies',onTap: ()=> print('Movies')),
                _AppBarButton(title: 'Latest',onTap: ()=> print('Latest')),
                _AppBarButton(title: 'My List',onTap: ()=> print('My List')),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 28,
                  onPressed: ()=> print('hello'),
                ),
                _AppBarButton(title: 'KIDS',onTap: ()=> print('KIDS')),
                _AppBarButton(title: 'DVD',onTap: ()=> print('DVD')),
                IconButton(
                  icon: Icon(Icons.card_giftcard),
                  color: Colors.white,
                  onPressed: ()=> print('hello'),
                  iconSize: 28,  
                  padding: EdgeInsets.zero,                                    
                )
              ],
            ),
          ),         
        ],  
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {

  final String title;
  final Function onTap;

  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
 



