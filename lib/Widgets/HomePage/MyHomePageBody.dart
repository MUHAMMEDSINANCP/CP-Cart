// ignore_for_file: file_names

import 'package:cp_cart/Screens/DetailsPage.dart';
import 'package:flutter/material.dart';

class MyHomePageBody extends StatelessWidget {
  const MyHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeadingTopBar(),
        BottomBodyContainer(),
      ],
    );
  }
}

class BottomBodyContainer extends StatelessWidget {
  const BottomBodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ]),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeadingText(),
              MyCandlesList(),
              SizedBox(
                height: 20,
              ),
              LineBar(),
              BottomBodyItems(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBodyItems extends StatelessWidget {
  const BottomBodyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Row(
            children: [
              Text(
                "Holiday Special",
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              Text(
                "View all",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildbottomContainer(),
              buildbottomContainer(),
              buildbottomContainer(),
              buildbottomContainer(),
            ],
          ),
        )
      ],
    );
  }

  Container buildbottomContainer() {
    return Container(
      height: 150,
      width: 200,
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset(
                    "assets/images/candel3.jpg",
                    fit: BoxFit.cover,
                  ))),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coconut Milk Bath"),
                  Text(
                    "16 oz",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "\$ 28",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 14,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildColumnAtTop("Candles", isSelected: true),
              buildColumnAtTop("vases"),
              buildColumnAtTop("bins"),
              buildColumnAtTop("Floral"),
              buildColumnAtTop("Decor"),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Padding buildColumnAtTop(String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (isSelected)
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
            )
        ],
      ),
    );
  }
}

class HeadingTopBar extends StatefulWidget {
  const HeadingTopBar({super.key});

  @override
  State<HeadingTopBar> createState() => _HeadingTopBarState();
}

class _HeadingTopBarState extends State<HeadingTopBar> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = "Home Decor"; // Set the default selected category
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              "CP ",
              style: TextStyle(
                  fontSize: 27, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            Text(
              "Cart",
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w500, letterSpacing: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFlatButton("Home Decor",
                  isSelected: selectedCategory == "Home Decor"),
              buildFlatButton("Bath & Body",
                  isSelected: selectedCategory == "Bath & Body"),
              buildFlatButton("Beauty",
                  isSelected: selectedCategory == "Beauty"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Padding buildFlatButton(final String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedCategory = text;
          });
          // ignore: avoid_print
          print("Button pressed");
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            isSelected ? Colors.white : Colors.black,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isSelected ? Colors.pink.shade100 : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class MyCandlesList extends StatelessWidget {
  const MyCandlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          buildColumnWithRow("1", "Elemental Tin Candel", "29", context),
          buildColumnWithRow("2", "Summer Candel", "23", context),
          buildColumnWithRow("3", "Winter candel", "40", context),
          buildColumnWithRow("4", "dummy candel", "60", context),
        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage(
            title: title,
            img: img,
            context: context,
            price: price,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/candel$img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$ $price",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({super.key});

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
