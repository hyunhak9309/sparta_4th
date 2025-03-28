import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final departureStation = useState('선택');
    final arrivalStation = useState('선택');

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('기차 예매')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text('출발역', style: TextStyle(fontSize: 14)),
                      GestureDetector(
                        onTap: () async {
                          String? result = await context.push(
                            '/station-list',
                            extra: {
                              'title': '출발역',
                              'selectedStation':
                                  arrivalStation.value == '선택'
                                      ? null
                                      : arrivalStation.value,
                            },
                          );
                          if (result != null) {
                            departureStation.value = result;
                          }
                        },
                        child: Text(
                          departureStation.value,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 70, width: 1, color: Colors.black54),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text('도착역', style: TextStyle(fontSize: 14)),
                      GestureDetector(
                        onTap: () async {
                          String? result = await context.push(
                            '/station-list',
                            extra: {
                              'title': '도착역',
                              'selectedStation':
                                  departureStation.value == '선택'
                                      ? null
                                      : departureStation.value,
                            },
                          );
                          if (result != null) {
                            arrivalStation.value = result;
                          }
                        },
                        child: Text(
                          arrivalStation.value,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (departureStation.value == '선택' ||
                  arrivalStation.value == '선택') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('출발역과 도착역을 선택해주세요.'),
                  duration: Duration(seconds: 2),
                  ),
                );
              } else {
                context.push('/seat-page', extra: {
                  'departure': departureStation.value,
                  'arrival': arrivalStation.value,
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
