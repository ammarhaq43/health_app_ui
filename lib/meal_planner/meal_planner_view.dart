import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/find_eat_cell.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/today_meal_row.dart';
import '../common/color_extension.dart';
import 'meal_food_details_view.dart';
import 'meal_schedule_view.dart';


class MealPlannerView extends StatefulWidget {
  const MealPlannerView({super.key});

  @override
  State<MealPlannerView> createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/m_1.png",
      "time": "28/05/2023 07:00 AM"
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/m_2.png",
      "time": "28/05/2023 08:00 AM"
    },
  ];

  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/m_3.png",
      "number": "120+ Foods"
    },
    {"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    Color listviewColor = isDarkMode ? Colors.red.shade100 : Colors.transparent;
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Meal Planner",
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meal Nutritions",
                        style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        )
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
                                      color: TColo.grey, fontSize: 14
                                  )
                                ),
                              )).toList(),
                              onChanged: (value) {},
                              icon:
                              Icon(Icons.expand_more, color: TColo.white),
                              hint: Text(
                                "Weekly",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: TColo.white, fontSize: 12
                                )
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: media.width * 0.5,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          // showingTooltipIndicators:
                          //     showingTooltipOnSpots.map((index) {
                          //   return ShowingTooltipIndicators([
                          //     LineBarSpot(
                          //       tooltipsOnBar,
                          //       lineBarsData.indexOf(tooltipsOnBar),
                          //       tooltipsOnBar.spots[index],
                          //     ),
                          //   ]);
                          // }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              // if (response == null || response.lineBarSpots == null) {
                              //   return;
                              // }
                              // if (event is FlTapUpEvent) {
                              //   final spotIndex =
                              //       response.lineBarSpots!.first.spotIndex;
                              //   showingTooltipOnSpots.clear();
                              //   setState(() {
                              //     showingTooltipOnSpots.add(spotIndex);
                              //   });
                              // }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                          radius: 3,
                                          color: Colors.white,
                                          strokeWidth: 3,
                                          strokeColor: TColo.secondaryColor1,
                                        ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipRoundedRadius: 20,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} mins ago",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData1,
                          minY: -0.5,
                          maxY: 110,
                          titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                sideTitles: bottomTitles,
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: rightTitles,
                              )),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            horizontalInterval: 25,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: TColo.grey.withOpacity(0.15),
                                strokeWidth: 2,
                              );
                            },
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: TColo.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Meal Schedule",
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          )
                        ),
                        SizedBox(
                          width: 72,
                          height: 25,
                          child: RoundButton(
                            title: "Check",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const MealScheduleView(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meals",
                        style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        )
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
                              items: [
                                "Breakfast",
                                "Lunch",
                                "Dinner",
                                "Snack",
                                "Dessert"
                              ].map((name) => DropdownMenuItem(
                                value: name,
                                child: Text(
                                  name,
                                  style: GoogleFonts.poppins(
                                      color: TColo.grey, fontSize: 14
                                  )
                                ),
                              )).toList(),
                              onChanged: (value) {},
                              icon:
                              Icon(Icons.expand_more, color: TColo.white),
                              hint: Text(
                                "Breakfast",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: TColo.white, fontSize: 12
                                )
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todayMealArr.length,
                      itemBuilder: (context, index) {
                        var mObj = todayMealArr[index] as Map? ?? {};
                        return TodayMealRow(
                          mObj: mObj,
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Find Something to Eat",
                style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                )
              ),
            ),
            SizedBox(
              height: media.width * 0.55,
              child: Container(
                color: listviewColor,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: findEatArr.length,
                    itemBuilder: (context, index) {
                      var fObj = findEatArr[index] as Map? ?? {};
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MealFoodDetailsView(eObj: fObj) ) );
                        },
                        child: FindEatCell(
                          fObj: fObj,
                          index: index,
                          color: Colors.blue,
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
  ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    gradient: LinearGradient(colors: [
      TColo.primaryColor2,
      TColo.primaryColor1,
    ]),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
        radius: 3,
        color: Colors.white,
        strokeWidth: 1,
        strokeColor: TColo.primaryColor2,
      ),
    ),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 35),
      FlSpot(2, 70),
      FlSpot(3, 40),
      FlSpot(4, 80),
      FlSpot(5, 25),
      FlSpot(6, 70),
      FlSpot(7, 35),
    ],
  );

  SideTitles get rightTitles => SideTitles(
    getTitlesWidget: rightTitleWidgets,
    showTitles: true,
    interval: 20,
    reservedSize: 40,
  );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: GoogleFonts.poppins(
          color: TColo.grey,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.poppins(
      color: TColo.grey,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}