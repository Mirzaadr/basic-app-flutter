import 'package:flutter/material.dart';
import 'package:starter_app/models/talent_model.dart';

class TalentDetail extends StatefulWidget {
  TalentDetail({Key? key, required this.data, required this.index})
      : super(key: key);
  final int index;
  final Talent data;

  @override
  _TalentDetailState createState() => _TalentDetailState();
}

class _TalentDetailState extends State<TalentDetail> {
  // final StreamController<HomeViewState> stateController =
  //     StreamController<HomeViewState>();

  // ScrollController _controller = new ScrollController();

  Future getData() async {}
  Widget _buildContent() {
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return Container(
            child: Column(
              children: [
                Text('${widget.data.talentName}'),
                Text('${widget.data.jobRoleName}'),
                Text('${widget.data.talentHp}')
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: _buildContent(),
    );
  }
}
