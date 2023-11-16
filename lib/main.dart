import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'First app',
      home: Scaffold(
        body: Malek(),
      ),
    ),
  );
}

class Malek extends StatelessWidget {
  const Malek({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();

    int month = now.month;
    int day = now.day;

    String getCurrentDayInEnglish() {
      List<String> dayNames = [
        "", // month index starts at 1, so we need an empty string for index 0
        "MONDAY ",
        "TUESDAY ",
        "WEDNESDAY",
        "THURSDAY ",
        "FRIDAY ",
        "SATURDAY ",
        "SUNDAY ",
      ];

      return dayNames[DateTime.now().weekday];
    }




    return Stack(
      children: [
        Container(
            color: Colors.white
        ),
        Scaffold(

          appBar: AppBar(

            backgroundColor: const Color(0xFF313854),
            title:
               const Text('1-Month Mobile Pass - College Student',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                ),),

            leading: const Icon(Icons.arrow_back_ios_new,size: 18)


          ),
        ),
         Align(
          alignment: const Alignment(0,-0.3),
          child: Image(
            image: const AssetImage('assets/images/Jt5OJBDj_400x400.png'),
            width: screenWidth*0.5,
            height: screenHeight*0.2,
            fit: BoxFit.cover, // scale image to cover the entire box
          )
        ),
        const Align(
          alignment: Alignment(0,-0.09),

          child: Text('Scan this code to ride',style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 13,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,


          ),),


        ),
         Align(
          alignment: const Alignment(0,0.1),

          child: Image(image: const AssetImage('assets/images/333254684_3934715443421591_5626463813014818928_n.jpg'),
            width: screenWidth*0.2,
            height: screenHeight*0.1,
            fit: BoxFit.cover,),
        ),
        Align(
          alignment: const Alignment(0, 0.3),
          child: Text.rich(
            TextSpan(
              text: getCurrentDayInEnglish(),
              style: const TextStyle(
                fontSize: 14,
                  color: Color(0xFF69678C),
                fontWeight: FontWeight.w500,

                  fontFamily: 'Roboto'

              ),
              children: [
                TextSpan(
                  text: day.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                      color: Color(0xFF69678C),
                    fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto'


                  ),
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment(0,0.35),
          child: Text('CURRENT TIME', style: TextStyle(

            fontSize: 15,
            fontWeight: FontWeight.w400,
              fontFamily: 'Roboto'

          ),),
        ),

        Align(
          alignment: const Alignment(0, 0.4),
          child: StreamBuilder<DateTime>(
            stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String formattedDate = DateFormat('h:mm:ss a').format(snapshot.data!);
                return Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),



        const Align(
          alignment: Alignment(0,0.45),
          child: Text('Expires: 12/31/2023',style: TextStyle(fontFamily: 'Roboto',fontSize: 14,),),
        ),
        const Align(
          alignment: Alignment(0,0.5),
          child: Text('2:00:00 AM'),
        ),
      ],


    );
  }
}
