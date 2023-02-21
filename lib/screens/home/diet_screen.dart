import 'package:flutter/material.dart';

// ignore: camel_case_types
class DietsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 61, 25, 67),
        title: new Text("Diets"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: new Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FittedBox(
                  child: new Text(
                    "7-day meal Diet plan",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 61, 25, 67),
                    ),
                  ),
                ),
                Text(
                  """Eating plans will vary from person to person based on biological gender, size, and goals.
          
Additionally, different coaches and nutritionists may make varying recommendations based on whether the person following a bodybuilding meal plan is trying to cut excess body fat or build lean muscle mass.""",
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                  """The most abundant macronutrient in the bodybuilder’s diet plan across all phases was carbohydrates from fruit, whole grains, and vegetables.
          
The same study states that protein from white meats, dairy, nuts, and seafood was the second most abundant macronutrient in a bodybuilder’s diet.
          
The study notes that bodybuilders ate fewer red meats and eggs, though they still received protein from those sources.
          
Portions will vary from person to person. For portion recommendations, a person should calculate their own macro needs or consult a certified nutritionist.
          
Here is a sample 7-day meal plan for bodybuilding.""",
                  textAlign: TextAlign.justify,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                Text("""Day 1
- Breakfast: scrambled eggs, stir-fried veggies, and oatmeal
- Snack: whey protein shake
- Lunch: grilled chicken breast, mixed greens, and baked sweet potato
- Snack: hard-boiled egg(s) and carrot sticks
- Dinner: broiled fish, green beans with brown rice

Day 2
- Breakfast: protein pancakes with fresh berries
- Snack: apple slices and almonds
- Lunch: lean ground beef burger on lettuce with tomato, onion, and green beans
- Snack: protein shake
- Dinner: shrimp stir-fried with bell pepper and brown rice over spinach

Day 3
- Breakfast: Greek yogurt, almonds or walnuts, whole grain granola, and fresh berries
- Snack: protein shake
- Lunch: grilled fish with a spinach salad and broccoli
- Snack: egg white omelet with bell peppers and mushrooms
- Dinner: chicken breast topped with fresh salsa with a sweet potato and a side salad

Day 4
- Breakfast: oatmeal with berries and scrambled egg whites
- Snack: turkey breast with carrots and celery
- Lunch: sirloin steak with broccoli and mushrooms
- Snack: apples with natural nut butter
- Dinner: broiled fish, brown rice, and a mixed green salad

Day 5
- Breakfast: protein shake with oatmeal
- Snack: hard-boiled egg whites with sliced peppers and cucumbers
- Lunch: grilled chicken with white bean and tomato salad
- Snack: Greek yogurt with berries and nuts
- Dinner: grilled fish with quinoa and green beans

Day 6
- Breakfast: scrambled egg whites with cheese, peppers, herbs, and Ezekiel bread
- Snack: protein shake
- Lunch: grilled chicken breast with bell peppers, black beans, and onions over romaine lettuce
- Snack: apple and almonds
- Dinner: sirloin steak with sweet potato and asparagus

Day 7
- Breakfast: Greek yogurt with whole grain granola and berries
- Snack: turkey breast with carrots and celery sticks
- Lunch: grilled chicken breast over spinach with sliced strawberries and almonds
- Snack: protein shake
- Dinner: shrimp stir-fried with peppers, onions, and broccoli over brown rice""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
