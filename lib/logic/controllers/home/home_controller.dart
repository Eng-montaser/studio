import 'package:get/get.dart';
import 'package:studio/models/print.dart';
import 'package:studio/ui/prints/album.dart';
import 'package:studio/ui/prints/layers.dart';
import 'package:studio/ui/prints/papers.dart';
import 'package:studio/ui/reserves_screens/birth_reservation_view.dart';
import 'package:studio/ui/reserves_screens/commercial_reservation_view.dart';
import 'package:studio/ui/reserves_screens/model_reservation_view.dart';
import 'package:studio/ui/reserves_screens/party_reservation_view.dart';
import 'package:studio/ui/reserves_screens/wedding_reservation_view.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  RxList<PrintData> printDataList = <PrintData>[].obs;
  RxList<PrintData> reserveDataList = <PrintData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    printDataList.value = [
      PrintData(image: 'assets/images/canab.jpeg', name: 'Layers'.tr,page: LayersScreen()),
      PrintData(image: 'assets/images/book.jpeg', name: 'Albums'.tr,page: AlbumsScreen()),
      PrintData(image: 'assets/images/pictures.jpeg', name: 'Papers'.tr,page: PapersScreen()),
    ];
    reserveDataList.value = [
      PrintData(image: 'assets/images/02.jpeg', name: 'Wedding'.tr,page: WeddingReservationView()),
      PrintData(image: 'assets/images/albn.jpg', name: 'Graduates'.tr,page: PartyReservationView()),
      PrintData(image: 'assets/images/back2.jpg', name: 'Trades'.tr,page: CommercialReservationView()),
      PrintData(image: 'assets/images/girlguy.jpg', name: 'Births'.tr,page: BirthReservationView()),
      PrintData(image: 'assets/images/wedding_home1.jpg', name: 'Model'.tr,page: ModelReservationView()),
      PrintData(image: 'assets/images/wedding_home6.png', name: 'Cinema'.tr,page: ModelReservationView()),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
