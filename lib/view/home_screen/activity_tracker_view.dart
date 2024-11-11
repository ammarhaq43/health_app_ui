import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/latest_activity_row.dart';
import '../../common_widget/today_target_cell.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerViewState();
}

class _ActivityTrackerViewState extends State<ActivityTrackerView> {
  int touchedIndex = -1;

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minute ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color subtextColor = isDarkMode ? Colors.black : TColo.grey;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    Color listviewColor = isDarkMode ? Colors.red.shade100 : Colors.transparent;
    Color textColor2 = isDarkMode ? Colors.black : Colors.grey;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
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
                color: iconBorderColor,
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
          "Activity Tracker",
          style: GoogleFonts.poppins(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
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
                  color: iconBorderColor,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    TColo.primaryColor2.withOpacity(0.3),
                    TColo.primaryColor1.withOpacity(0.3)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Target",
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColo.primaryG,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                height: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                textColor: TColo.primaryColor1,
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: Colors.transparent,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/water.png",
                            value: "8L",
                            title: "Water Intake",
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/foot.png",
                            value: "2400",
                            title: "Foot Steps",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity  Progress",
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColo.primaryG),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: ["Weekly", "Monthly"]
                              .map((name) => DropdownMenuItem(
                            value: name,
                            child: Text(
                              name,
                              style: GoogleFonts.poppins(
                                  color: TColo.grey, fontSize: 14),
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {},
                          icon: Icon(Icons.expand_more, color: TColo.white),
                          hint: Text(
                            "Weekly",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: TColo.white, fontSize: 12),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                height: media.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                decoration: BoxDecoration(
                    color: TColo.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 3)
                    ]),
                child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                          tooltipMargin: 10,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String weekDay;
                            switch (group.x) {
                              case 0:
                                weekDay = 'Monday';
                                break;
                              case 1:
                                weekDay = 'Tuesday';
                                break;
                              case 2:
                                weekDay = 'Wednesday';
                                break;
                              case 3:
                                weekDay = 'Thursday';
                                break;
                              case 4:
                                weekDay = 'Friday';
                                break;
                              case 5:
                                weekDay = 'Saturday';
                                break;
                              case 6:
                                weekDay = 'Sunday';
                                break;
                              default:
                                throw Error();
                            }
                            return BarTooltipItem(
                              '$weekDay\n',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (rod.toY - 1).toString(),
                                  style: GoogleFonts.poppins(
                                      color: TColo.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            );
                          },
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTitles,
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: FlGridData(show: false),
                    )),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Workout",
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: GoogleFonts.poppins(
                          color: TColo.primaryColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: latestArr.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: media.width * 0.03,
                          left: media.width * 0.02,
                          right: media.width * 0.02),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: listviewColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: iconBorderColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              latestArr[index]["image"],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  latestArr[index]["title"],
                                  style: GoogleFonts.poppins(
                                      color: textColor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  latestArr[index]["time"],
                                  style: GoogleFonts.poppins(
                                      color: subtextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }


  Widget getTitles(double value, TitleMeta meta) {
    var style = GoogleFonts.poppins(
      color: TColo.grey,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('Sun', style: style);
        break;
      case 1:
        text =  Text('Mon', style: style);
        break;
      case 2:
        text =  Text('Tue', style: style);
        break;
      case 3:
        text =  Text('Wed', style: style);
        break;
      case 4:
        text =  Text('Thu', style: style);
        break;
      case 5:
        text =  Text('Fri', style: style);
        break;
      case 6:
        text =  Text('Sat', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, TColo.primaryG , isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 10.5, TColo.secondaryG, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, TColo.primaryG , isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, TColo.secondaryG, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 15, TColo.primaryG , isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 5.5, TColo.secondaryG, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 8.5, TColo.primaryG , isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartGroupData makeGroupData(
      int x,
      double y,
      List<Color> barColor,
      {
        bool isTouched = false,

        double width = 22,
        List<int> showTooltips = const [],
      }) {

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(colors: barColor, begin: Alignment.topCenter, end: Alignment.bottomCenter ),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TColo.lightGrey,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}