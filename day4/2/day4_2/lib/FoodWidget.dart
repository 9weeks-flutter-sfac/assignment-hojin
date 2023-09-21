import 'package:flutter/material.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget(
      {Key? key,
      required this.food,
      required this.imgUrl,
      required this.addToFoodList})
      : super(key: key);
  final String food;
  final String imgUrl;
  final Function(String) addToFoodList;

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

List<String> foodList = [];
String selectFood = '';

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.addToFoodList(widget.food);
      },
      child: Card(
        child: Container(
          width: 100,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  child: Image.asset(
                widget.imgUrl,
                fit: BoxFit.cover,
                width: 150,
                height: 80,
              )),
              Text(
                widget.food,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('[담기]')
            ],
          ),
        ),
      ),
    );
  }
}
