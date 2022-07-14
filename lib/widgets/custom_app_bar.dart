import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key key, this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black.withOpacity(
        (scrollOffset / 80).clamp(0, 1).toDouble(),
      ),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () {
                    print("TV Shows");
                  },
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () {
                    print("Movies");
                  },
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () {
                    print("My List");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Home",
                  onTap: () {
                    print("Home");
                  },
                ),
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () {
                    print("TV Shows");
                  },
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () {
                    print("Movies");
                  },
                ),
                _AppBarButton(
                  title: "Lastest",
                  onTap: () {
                    print("Lastest");
                  },
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () {
                    print("My List");
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Home",
                  onTap: () {
                    print("Home");
                  },
                ),
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () {
                    print("TV Shows");
                  },
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () {
                    print("Movies");
                  },
                ),
                _AppBarButton(
                  title: "Lastest",
                  onTap: () {
                    print("Lastest");
                  },
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () {
                    print("My List");
                  },
                ),
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

  const _AppBarButton({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
