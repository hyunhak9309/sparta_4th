import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const stationList = [
  '수서',
  '동탄',
  '평택지제',
  '천안아산',
  '오송',
  '대전',
  '김천구미',
  '동대구',
  '경주',
  '울산',
  '부산',
];

class StationListPage extends StatelessWidget {
  const StationListPage({
    super.key,
    required this.title,
    required this.selectedStation,
  });
  final String title;
  final String? selectedStation;

  @override
  Widget build(BuildContext context) {
    final filteredStationList =
        selectedStation == null
            ? stationList
            : stationList
                .where((station) => station != selectedStation)
                .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        scrolledUnderElevation: 0,
      ),
      body: ListView.builder(
        itemCount:
            selectedStation == null
                ? stationList.length
                : stationList.length - 1,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pop(filteredStationList[index]);
            },
            child: ListTile(title: Text(filteredStationList[index])));
        },
      ),
    );
  }
}
