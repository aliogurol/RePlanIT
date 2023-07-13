import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class BaseLine extends StatelessWidget {
  final List<LaptopData> laptops;

  const BaseLine({
    Key? key,
    required this.laptops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (laptops.isEmpty) {
      return Column(
        children: [
          BuildHeader.buildHeader('BASE LINE'),
        ],
      );
    }

    return Column(
      children: [
        BuildHeader.buildHeader('BASE LINE'),
        SizedBox(height: 20),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            children: [
              Flexible(fit: FlexFit.loose,child: _buildCircleAvatarAndText()),
              Flexible(
                fit: FlexFit.loose,
                child: BasicLaptopInfo(laptop:laptopInfoData.where((laptop) => laptop.status == 'New').first)
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleAvatarAndText() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/id/523583101/nl/foto/modern-laptop-with-white-screen-3d-illustration.jpg?s=612x612&w=0&k=20&c=EY9031eYoOFQYy_uywaF9s1v9qk1R7JLjM-aVfT6dLE="),
        ),
        const Icon(
          Icons.arrow_forward,
          color: Colors.grey,
        ),
        _buildTotals(),
      ],
    );
  }

Container _buildTotals() {
  return Container(
    height: 500,
    width: 300,
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Totals for 1 piece',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 20),
        ListBody(
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text('Sustainabilitiy'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Circularity', style: TextStyle(color: Colors.green)),
                      Text('  primary material use', style: TextStyle(color: Colors.green, fontSize: 12)),
                      SizedBox(height: 10,),
                      Text('Total GHG emission per year', style: TextStyle(color: Colors.green)),
                      Text('  emission production divided over lifetime', style: TextStyle(color: Colors.green, fontSize: 12)),
                      Text('  emission use phase per year (incl. elec./scope)',style: TextStyle(color: Colors.green,fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ), 
            SizedBox(height: 20),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text('business indicator'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Energy consumption in use per year',style: TextStyle(color: Colors.orange)),
                      SizedBox(height: 10,),  
                      Text('Expected LifeTime',style: TextStyle(color: Colors.green)),
                      SizedBox(height: 10,), 
                      Text('Total cost of use'),
                      Text('. Purchase cost',style: TextStyle(color: Colors.black,fontSize: 12),),
                      Text('. GHG use',style: TextStyle(color: Colors.black,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text('Delivery Time'),
                      SizedBox(height: 5,),
                      Text('Specific spare part availability'),
                      SizedBox(height: 5,),
                      Text('Support Period'),
                      SizedBox(height: 5,),
                      Text('Stock in the market'),
                      SizedBox(height: 5,),
                      Text('Critical Materials'),
                      SizedBox(height: 5,),
                      Text('Repairability'),
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ],
    ),
  );
}

  Widget test() {
    return Container(
      height: 500,
      width: 300,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Totals for 1 piece',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          ListBody(
            children: [
              ListTile(
                title: const Text('Circularity', style: TextStyle(color: Colors.green)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('. primary material use', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                ),
                trailing: const Icon(Icons.check, color: Colors.green),
              ),
              ListTile(
                title: const Text('Total GHG emission per year', style: TextStyle(color: Colors.green)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('.emission production divided over lifetime', style: TextStyle(color: Colors.green, fontSize: 12)),
                    Text('.emission use phase per year (incl. elec./scope)',style: TextStyle(color: Colors.green,fontSize: 12)),
                  ],
                ),
              ),
              ListTile(title: Text('Energy consumption in use per year',style: TextStyle(color: Colors.orange))),              
              ListTile(title: Text('Expected LifeTime',style: TextStyle(color: Colors.green))),
              ListTile(
                title: const Text('Total cost of use'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('. Purchase cost',style: TextStyle(color: Colors.black,fontSize: 12),),
                    Text('. GHG use',style: TextStyle(color: Colors.black,fontSize: 12),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text('Delivery Time'),
              SizedBox(height: 5,),
              Text('Specific spare part availability'),
              SizedBox(height: 5,),
              Text('Support Period'),
              SizedBox(height: 5,),
              Text('Stock in the market'),
              SizedBox(height: 5,),
              Text('Critical Materials'),
              SizedBox(height: 5,),
              Text('Repairability'),
            ],
          ),
        ],
      ),
    );
  }
}
