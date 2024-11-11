import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/meal_food_schedule_row.dart';
import '../../common_widget/nutritions_row.dart';
import '../common/color_extension.dart';

class MealScheduleView extends StatefulWidget {
  const MealScheduleView({super.key});

  @override
  State<MealScheduleView> createState() => _MealScheduleViewState();
}

class _MealScheduleViewState extends State<MealScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();

  late DateTime _selectedDateAppBar;

  List breakfastArr = [
    {
      "name": "Honey Pancake",
      "time": "07:00am",
      "image": "assets/img/honey_pan.png"
    },
    {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
  ];

  List lunchArr = [
    {
      "name": "Chicken Steak",
      "time": "01:00pm",
      "image": "assets/img/chicken.png"
    },
    {
      "name": "Milk",
      "time": "01:20pm",
      "image": "assets/img/glass-of-milk 1.png"
    },
  ];

  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
    {
      "name": "Apple Pie",
      "time": "04:40pm",
      "image": "assets/img/apple_pie.png"
    },
  ];

  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png"},
    {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png"},
  ];

  List nutritionArr = [
    {
      "title": "Calories",
      "image": "assets/img/burn.png",
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "assets/img/proteins.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/img/egg.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": "assets/img/carbo.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
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
          "Meal Schedule",
          style: GoogleFonts.poppins(
            color: isDarkMode ? Colors.white : TColo.black,
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
          )
        ],
      ),
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
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
              ),
            ),
            calendarLogo: Image.asset(
              "assets/img/ArrowRight.png",
              color: isDarkMode ? Colors.black : Colors.white,
              width: 15,
              height: 15,
            ),
            weekDay: WeekDay.short,
            backgroundColor: isDarkMode ? Colors.transparent : Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: isDarkMode ? Colors.white : Colors.white,
            dateColor: isDarkMode ? Colors.white : Colors.black,
            locale: 'en',
            initialDate: DateTime.now(),
            calendarEventColor: TColo.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),
            onDateSelected: (date) {
              setState(() {
                _selectedDateAppBar = date;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMealSection("Breakfast", breakfastArr, "230 calories", isDarkMode),
                  _buildMealSection("Lunch", lunchArr, "500 calories", isDarkMode),
                  _buildMealSection("Snacks", snacksArr, "140 calories", isDarkMode),
                  _buildMealSection("Dinner", dinnerArr, "120 calories", isDarkMode),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Today Meal Nutritions",
                      style: GoogleFonts.poppins(
                        color: isDarkMode ? Colors.white : TColo.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    color: isDarkMode ? Colors.white : Colors.transparent,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: nutritionArr.length,
                      itemBuilder: (context, index) {
                        var nObj = nutritionArr[index] as Map? ?? {};
                        return NutritionRow(nObj: nObj);
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealSection(String title, List items, String caloriesInfo, bool isDarkMode) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: isDarkMode ? Colors.white : TColo.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "${items.length} Items | $caloriesInfo",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : TColo.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            var mObj = items[index] as Map? ?? {};
            return MealFoodScheduleRow(
              mObj: mObj,
              index: index,
              isDarkMode: isDarkMode,
            );
          },
        ),
      ],
    );
  }
}