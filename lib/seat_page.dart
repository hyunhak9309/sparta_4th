import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SeatPage extends HookWidget {
  const SeatPage({super.key, required this.departure, required this.arrival});
  final String departure;
  final String arrival;

  @override
  Widget build(BuildContext context) {
    final selectedSeat = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('좌석 선택'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                departure,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Text(
                arrival,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 24, height: 24, color: Colors.purple),
              Text('선택됨'),
              Container(width: 24, height: 24, color: Colors.grey[300]),
              Text('선택안됨'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (index != 0) {
                                if (selectedSeat.value == index * 4) {
                                  selectedSeat.value = null;
                                } else {
                                  selectedSeat.value = index * 4;
                                }
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              color:
                                  index == 0
                                      ? null
                                      : selectedSeat.value == index * 4
                                      ? Colors.purple
                                      : Colors.grey[300],
                              child: index == 0 ? Text('A') : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (index != 0) {
                                if (selectedSeat.value == index * 4 + 1) {
                                  selectedSeat.value = null;
                                } else {
                                  selectedSeat.value = index * 4 + 1;
                                }
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              color:
                                  index == 0
                                      ? null
                                      : selectedSeat.value == index * 4 + 1
                                      ? Colors.purple
                                      : Colors.grey[300],
                              child: index == 0 ? Text('B') : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 24,
                            height: 24,
                            child: index != 0 ? Text('$index') : null,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (index != 0) {
                                if (selectedSeat.value == index * 4 + 2) {
                                  selectedSeat.value = null;
                                } else {
                                  selectedSeat.value = index * 4 + 2;
                                }
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              color:
                                  index == 0
                                      ? null
                                      : selectedSeat.value == index * 4 + 2
                                      ? Colors.purple
                                      : Colors.grey[300],
                              child: index == 0 ? Text('C') : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (index != 0) {
                                if (selectedSeat.value == index * 4 + 3) {
                                  selectedSeat.value = null;
                                } else {
                                  selectedSeat.value = index * 4 + 3;
                                }
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              color:
                                  index == 0
                                      ? null
                                      : selectedSeat.value == index * 4 + 3
                                      ? Colors.purple
                                      : Colors.grey[300],
                              child: index == 0 ? Text('D') : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            if (selectedSeat.value != null) {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('예매 하시겠습니까?'),
                  content: Text(
                    '선택한 좌석: ${selectedSeat.value != null ? '${selectedSeat.value! ~/ 4}-${String.fromCharCode(65 + selectedSeat.value! % 4)}' : '없음'}',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('취소'),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('확인'),
                      onPressed: () {
                        context.pop();
                        context.pop();
                      },
                    ),
                  ],
                );
                },
              );
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            child: Center(
              child: Text(
                '예매 하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
