import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/data/data.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_appbar.dart';
import 'components/discussion_info_detail.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Market Place Sreen'),
      ),
      body: Center(
        child: Container(
          height: 540,
          padding: EdgeInsets.all(appPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MarketPlace',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              
              SizedBox(
                height: appPadding,
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: discussionData.length,
                  itemBuilder: (context, index) => DiscussionInfoDetail(info: discussionData[index],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
