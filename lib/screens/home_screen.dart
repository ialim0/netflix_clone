import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';

import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widgets/previews.dart';

import '../widgets/content_List.dart';
import '../widgets/content_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.cast),
        onPressed: () {
          print('Cast');
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey("Previews"),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey("My List"),
            child: ContentList(
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey("Netflix Originals"),
            child: ContentList(
              title: "Netflix Originals",
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            key: PageStorageKey("Trending"),
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              // ignore: missing_required_param
              child: ContentList(
                title: "Trending",
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
