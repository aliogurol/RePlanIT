class ServerData {
  final String id;
  final String name;
  final String currentWorkload;
  final String memoryUsage;
  final String cpuUsage;
  final String powerDraw;
  final String status;
  final int advisedActions;
  final String farmName;
  final String farmLocation;
  final String farmSize;
  final String cpuCapacity;
  final String memoryCapacity;
  final String energyConsuptionPerYear;

  ServerData({
    required this.id,
    required this.name,
    required this.currentWorkload,
    required this.memoryUsage,
    required this.cpuUsage,
    required this.powerDraw,
    required this.status,
    required this.advisedActions,
    required this.farmName,
    required this.farmSize,
    required this.farmLocation,
    required this.cpuCapacity,
    required this.memoryCapacity,
    required this.energyConsuptionPerYear,
  });
}