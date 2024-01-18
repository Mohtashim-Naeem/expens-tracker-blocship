import 'package:expense_tracker_blocship/services/entries_service.dart';
import 'package:expense_tracker_blocship/views/add_entry/add_entry.dart';
import 'package:expense_tracker_blocship/views/home/home.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: homeView, initial: true),
  MaterialRoute(page: AddEntry),
], dependencies: [
  // LazySingleton(classType: RouterService),
  LazySingleton(classType: EntryService),

  Singleton(classType: NavigationService),
])
class App {}
