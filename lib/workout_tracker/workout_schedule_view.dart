import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/common.dart';
import '../../common_widget/round_button.dart';
import '../common/color_extension.dart';
import 'add_schedule_view.dart';

class WorkoutScheduleView extends StatefulWidget {
  const WorkoutScheduleView({super.key});

  @override
  State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
}

class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();
  late DateTime _selectedDateAppBar;

  List eventArr = [
    {"name": "Ab Workout", "start_time": "25/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "25/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "25/05/2023 03:00 PM"},
    {"name": "Ab Workout", "start_time": "26/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "26/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "26/05/2023 03:00 PM"},
    {"name": "Ab Workout", "start_time": "27/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "27/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "27/05/2023 03:00 PM"}
  ];

  List selectDayEventArr = [];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBar = DateTime.now();
    setDayEventWorkoutList();
  }

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBar);
    selectDayEventArr = eventArr.map((wObj) {
      return {
        "name": wObj["name"],
        "start_time": wObj["start_time"],
        "date": stringToDate(wObj["start_time"].toString(),
            formatStr: "dd/MM/yyyy hh:mm aa")
      };
    }).where((wObj) {
      return dateToStartDate(wObj["date"] as DateTime) == date;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColo.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColo.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Workout Schedule",
          style: TextStyle(
              color: TColo.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColo.lightGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColo.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/ArrowLeft.png",
                  width: 15,
                  height: 15,
                )),
            calendarLogo: Icon(Icons.arrow_forward_ios),
            backgroundColor: Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            locale: 'en',
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),
            onDateSelected: (date) {
              _selectedDateAppBar = date;
              setDayEventWorkoutList();
            },
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                var timelineDataWidth = (media.width * 1.5) - (80 + 40);
                var availWidth = (media.width * 1.2) - (80 + 40);
                var slotArr = selectDayEventArr.where((wObj) {
                  return (wObj["date"] as DateTime).hour == index;
                }).toList();

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getTime(index * 60),
                          style: TextStyle(color: TColo.black, fontSize: 12),
                        ),
                      ),
                      if (slotArr.isNotEmpty)
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: slotArr.map((sObj) {
                              var min = (sObj["date"] as DateTime).minute;
                              var pos = (min / 60) * 2 - 1;

                              return Align(
                                alignment: Alignment(pos, 0),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          contentPadding: EdgeInsets.zero,
                                          content: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: TColo.white,
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        margin:
                                                        const EdgeInsets
                                                            .all(8),
                                                        height: 40,
                                                        width: 40,
                                                        alignment:
                                                        Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: TColo
                                                                .lightGrey,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10)),
                                                        child: Image.asset(
                                                          "assets/img/closed_btn.png",
                                                          width: 15,
                                                          height: 15,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "Workout Schedule",
                                                      style: TextStyle(
                                                          color: TColo.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        margin:
                                                        const EdgeInsets
                                                            .all(8),
                                                        height: 40,
                                                        width: 40,
                                                        alignment:
                                                        Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: TColo
                                                                .lightGrey,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10)),
                                                        child: Image.asset(
                                                          "assets/img/more_btn.png",
                                                          width: 15,
                                                          height: 15,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  sObj["name"].toString(),
                                                  style: TextStyle(
                                                      color: TColo.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/img/time_workout.png",
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "${getDayTitle(sObj["start_time"].toString())} | ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                                      style: TextStyle(
                                                          color: TColo.grey,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                RoundButton(
                                                  title: "Set Reminder",
                                                  onPressed: () {},
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: timelineDataWidth,
                                    height: 30,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: TColo.lightGrey,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      sObj["name"].toString(),
                                      style: TextStyle(
                                          color: TColo.black, fontSize: 10),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: TColo.lightGrey,
                height: 1,
                thickness: 0.5,
              ),
              itemCount: 24,
            ),
          )
        ],
      ),
    );
  }
}
