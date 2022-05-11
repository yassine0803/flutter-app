import 'package:flutter/material.dart';
import 'package:notify/providers/user_provider.dart';
import 'package:notify/widgets/top_widget.dart';
import 'package:notify/widgets/user_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 3000), () {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<UserProvider>(context, listen: false).getUsers();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> userWidget = [];
    context.watch<UserProvider>().users.asMap().forEach((int index, user) {
      userWidget.add(UsersWidget(
        index: index,
        user: user,
      ));
    });
    List<Widget> userPlaceholder = ['', '', '']
        .map((e) => Container(
              padding: EdgeInsets.only(
                left: 21,
                top: 11,
                right: 17,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 38,
                        ),
                        child: SizedBox(
                          width: 70,
                          height: 10,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(.5),
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 32,
                        ),
                        child: SizedBox(
                          width: 58,
                          height: 10,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(.5),
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 10,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(.5),
                              highlightColor: Colors.white,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 80,
                            height: 10,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(.5),
                              highlightColor: Colors.white,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    height: 1,
                    color: Color(0xffE2E4E5),
                  ),
                ],
              ),
            ))
        .toList();
    List<Widget> widgetdata = context.watch<UserProvider>().users.length > 0
        ? userWidget
        : userPlaceholder;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff000000),
          ),
          title: Text('Users'),
          centerTitle: true,
          backgroundColor: Color(0xffffffff),
          titleTextStyle: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopWidget(),
              Container(
                padding: EdgeInsets.only(
                  left: 21,
                  top: 15,
                  right: 17,
                ),
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 108,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Role',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        width: 118,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Branch',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 18,
                endIndent: 15,
                height: 1,
                color: Color(0xffE2E4E5),
              ),
              ...widgetdata,
            ],
          ),
        ),
      ),
    );
  }
}
