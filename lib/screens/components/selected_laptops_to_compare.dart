import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/suggestions.dart';

class SelectedLaptopsList extends StatelessWidget {
  final List<LaptopData> laptops;

  const SelectedLaptopsList({
    Key? key,
    required this.laptops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeader.buildHeader('SELECTED LAPTOPS'),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: laptops.length,
              itemBuilder: (BuildContext context, int index) {
                final laptop = laptops[index];
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Flexible(fit:FlexFit.loose, child: BasicLaptopInfo(laptop: laptop)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BasicLaptopInfo extends StatelessWidget {
  final LaptopData laptop;
  const BasicLaptopInfo({required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            children: [
              Text(laptop.status),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: Text(getSuggestion(laptop),textAlign: TextAlign.center,),
              ),
              Flexible(
                child: Image.network(
                  laptop.image,
                  width: 60,
                ),
              ),
              Text(laptop.brand, style: TextStyle(fontSize: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.green,
                    size: 15,
                  ),
                  Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.green,
                    size: 15,
                  ),
                  Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              SizedBox(height: 40,),
              LaptopSustainabilityInfo(),
              SizedBox(height: 20,),
              Container(margin: EdgeInsets.only(bottom: 20),child: buildOrderButton()),
            ],
          ),
        ),
      ],
    );
  }
}

class LaptopSustainabilityInfo extends StatelessWidget {
  // final LaptopData laptop;
  // const LaptopSustainabilityInfo({required this.laptop});

  @override
  Widget build(BuildContext context) {
    const greenTextStyle = TextStyle(color: Colors.green);
    const redTextStyle = TextStyle(color: Colors.red);
    const blackTextStyle = TextStyle(color: Colors.black);
    const greyTextStyle = TextStyle(color: Colors.grey);

    return Column(
      children: [
        Column(
          children: [
          Text('30%', style: greenTextStyle),
          Text('0 kg', style: greenTextStyle),
          SizedBox(height: 10),
        
          // Weight
          Text('25 kton', style: redTextStyle),
          SizedBox(height: 10),
          Text('0 kton', style: greenTextStyle),
          Text('25 kton', style: blackTextStyle),
          SizedBox(height: 10),
        
          // Power
          Text('300 kWh', style: blackTextStyle),
          SizedBox(height: 15),
        
          // Lifespan
          Text('6 years', style: blackTextStyle),
          SizedBox(height: 15),
        
          // Price
          Text('€330', style: blackTextStyle),
          Text('€300', style: greyTextStyle),
          Text('€30', style: greyTextStyle),
          SizedBox(height: 10),
        
          // Warranty
          Text('0 weken', style: blackTextStyle),
          SizedBox(height: 10),
        
          // Performance
          Text('medium', style: blackTextStyle),
          SizedBox(height: 10),
        
          // Longevity
          Text('4 years', style: blackTextStyle),
          SizedBox(height: 10),
        
          // Sustainability
          Text('nvt', style: blackTextStyle),
          SizedBox(height: 10),
          Text('0.02%', style: blackTextStyle),
        
          // Endurance
          SizedBox(height: 10),
          Text('meduim', style: blackTextStyle),
          ],
        ),
      ],
    );
  }
}

Widget buildOrderButton() {
  return MaterialButton(
    // height: 40,
    // minWidth: 60,
    color: Colors.grey,
    onPressed: () {
    },
    child: Text('Order',style: TextStyle(color: Colors.white)),
  );
}
  
String getSuggestion(selectedLaptops) {
  var score = SuggestionProvider.calculateScore(selectedLaptops);
  return SuggestionProvider.getSuggestion(score);
}
