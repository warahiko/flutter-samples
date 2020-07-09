import 'package:flutter/material.dart';

class NestedScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text(
                    'NestedScrollView sample',
                    style: textTheme.headline6,
                  ),
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: const TabBar(tabs: <Widget>[
                    Tab(
                      text: 'One',
                    ),
                    Tab(
                      text: 'Two',
                    ),
                  ]),
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ListPage('One'),
              ListPage('Two'),
            ],
          ),
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final String name;

  ListPage(this.name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            key: PageStorageKey(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 30,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
