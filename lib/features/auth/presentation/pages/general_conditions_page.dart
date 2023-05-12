import 'package:flutter/material.dart';
import 'package:waaa/core/util/mocks/users.dart';

class GeneralConditionPage extends StatelessWidget {
  const GeneralConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 200.0,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  mockYamiYugi.photo!,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
