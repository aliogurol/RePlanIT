

import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/analytic_info_model.dart';
import 'package:responsive_admin_dashboard/models/discussions_info_model.dart';
import 'package:responsive_admin_dashboard/models/referal_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Laptops",
    count: 720,
    svgSrc: "assets/icons/laptop.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Servers",
    count: 820,
    svgSrc: "assets/icons/Server.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Switches",
    count: 920,
    svgSrc: "assets/icons/Switch.svg",
    color: orange,
  ),
  AnalyticInfo(
    title: "Routers",
    count: 920,
    svgSrc: "assets/icons/Router.svg",
    color: green,
  ),
];

List discussionData = [
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/user.png",
    name: "Name Surname",
    date: "Jan 25,2021",
  ),
];

List referalData = [
  ReferalInfoModel(
    title: "Replace fans by new ones",
    count: 0,
    svgSrc: "",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Replace fans by remanufactured  ones",
    count: 234,
    svgSrc: "assets/icons/Twitter.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Keep current fans",
    count: 234,
    svgSrc: "assets/icons/Linkedin.svg",
    color: primaryColor,
  ),

  // ReferalInfoModel(
  //   title: "Dribble",
  //   count: 234,
  //   svgSrc: "assets/icons/Dribbble.svg",
  //   color: red,
  // ),
];
