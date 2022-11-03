import 'package:flutter/material.dart';

import '../widget/person_widget/custom_appBar.dart';
import '../widget/person_widget/profile_pages.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(),
              SliverToBoxAdapter(
                child: Container(child: ProfilePages()),
              ),
            ];
          },
          body: Text("heloo"),
        ));
  }
}
