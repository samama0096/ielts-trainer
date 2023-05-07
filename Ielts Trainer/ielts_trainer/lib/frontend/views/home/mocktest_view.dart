import 'package:flutter/material.dart';
import 'package:ielts_trainer/frontend/views/home/mocktestitems/dummydata.dart';
import 'package:ielts_trainer/frontend/views/home/mocktestitems/mock_tabs.dart';

import '../../utils/const/mycolors.dart';

class MockTest extends StatefulWidget {
  const MockTest({super.key});

  @override
  State<MockTest> createState() => _MockTestState();
}

class _MockTestState extends State<MockTest>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.square(70),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: TabBar(
            indicatorWeight: 1.5,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: MyColors.primaryBtnC,
            labelStyle: TextStyle(color: MyColors.primaryBtnC),
            unselectedLabelColor: MyColors.textC.withOpacity(0.6),
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Listening',
              ),
              Tab(
                text: 'Reading',
              ),
              Tab(
                text: 'Speaking',
              ),
              Tab(
                text: 'Writing',
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: TabBarView(controller: tabController, children: [
          getMockTestWidget(MockTestDummy.mtdata, context),
          getMockTestWidget(MockTestDummy.mtdata, context),
          getMockTestWidget(MockTestDummy.mtdata, context),
          getMockTestWidget(MockTestDummy.mtdata, context),
        ]),
      ),
    );
  }
}
