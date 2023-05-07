import 'package:flutter/material.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:ielts_trainer/frontend/views/home/pmaterialitems/dummydata.dart';
import 'package:ielts_trainer/frontend/views/home/pmaterialitems/pmaterial_tabs.dart';

class PMaterialView extends StatefulWidget {
  const PMaterialView({super.key});

  @override
  State<PMaterialView> createState() => _PMaterialViewState();
}

class _PMaterialViewState extends State<PMaterialView>
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
    Size s = MediaQuery.of(context).size;
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
          getPMaterialWidget(PMaterialDummy.listeningpmaterialList, context),
          getPMaterialWidget(PMaterialDummy.readingpmaterialList, context),
          getPMaterialWidget(PMaterialDummy.speakpmaterialList, context),
          getPMaterialWidget(PMaterialDummy.writingpmaterialList, context),
        ]),
      ),
    );
  }
}
