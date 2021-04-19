import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/models/talent_model.dart';
import 'package:starter_app/routes/main_route.dart';
import 'package:starter_app/services/api_services.dart';

enum HomeViewState { Busy, DataRetrieved, NoData }

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  DashboardPage createState() => DashboardPage();
}

class DashboardPage extends State<Dashboard> {
  final StreamController<HomeViewState> stateController =
      StreamController<HomeViewState>();

  static int currentPage = 1;
  bool isLoading = false;
  List<Talent>? listTalents;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    _getData();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // _getMoreData(page);
        _loadMore(page: currentPage);
        print('triggered');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ));
  }

  Future _getData() async {
    stateController.add(HomeViewState.Busy);
    try {
      Response res = await ApiServices().dio.get('api/TalentData');
      List<Talent> data =
          res.data.map<Talent>((model) => Talent.fromJson(model)).toList();
      listTalents = data;
      currentPage = 2;

      stateController.add(HomeViewState.DataRetrieved);
    } catch (e) {
      print(e);
      return stateController.addError(
          'An error occurred while fetching the data. Please try again later.');
    }
  }

  Future _loadMore({int page = 1}) async {
    if (!isLoading) {
      try {
        Response res = await ApiServices()
            .dio
            .get('api/TalentData', queryParameters: {'PageNumber': page});
        List<Talent> data =
            res.data.map<Talent>((model) => Talent.fromJson(model)).toList();
        if (page != 0) {
          listTalents?.addAll(data);
        } else {
          listTalents = data;
        }
        setState(() {
          currentPage++;
        });
      } catch (e) {
        print(e);
        return stateController.addError(
            'An error occurred while fetching the data. Please try again later.');
      }
    }
  }

  Widget _buildContent() {
    return StreamBuilder(
        stream: stateController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _getInformationMessage(snapshot.error.toString());
          }

          if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
            return Center(child: CircularProgressIndicator());
          }

          // use explicit state instead of checking the length
          if (snapshot.data == HomeViewState.NoData || listTalents == null) {
            return _getInformationMessage(
                'No data found for your account. Add something and check back.');
          }

          return RefreshIndicator(
            onRefresh: () => _getData(),
            child: new CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                new SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => TalentItem(
                            data: listTalents?[index] as Talent,
                            onTap: () => Navigator.of(context).pushNamed(
                                AppRoutes.detail,
                                arguments: listTalents?[index]),
                          ),
                      childCount: listTalents?.length),
                ),
                new SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );

          // return Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: GridView.builder(
          //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //           maxCrossAxisExtent: 200,
          //           childAspectRatio: 2 / 2,
          //           crossAxisSpacing: 5,
          //           mainAxisSpacing: 5),
          //       itemCount: listTalents?.length,
          //       controller: _controller,
          //       itemBuilder: (buildContext, index) =>
          //           TalentItem(data: listTalents?[index] as Talent)),
          // );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _getData(),
        //   child: Icon(Icons.reply_outlined),
        // ),
        backgroundColor: Colors.grey[100],
        body: _buildContent());
  }
}

class TalentItem extends StatelessWidget {
  const TalentItem({Key? key, required this.data, this.onTap})
      : super(key: key);

  final Talent data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                data.talentImageHash != null
                    ? data.talentImageHash as String
                    : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                height: 39,
              ),
              Text('${data.talentName}'),
              Text('${data.jobRoleName}'),
            ],
          ),
        ),
      ),
    ));
  }
}
