import 'package:get/get.dart';
import 'package:studio/logic/cash_helper.dart';

class SystemController extends GetxController {
  bool loginStatus = false;
  bool showOnBoard = true;
  bool loading = true;

  Future<int> init() async {
    int id = 0;
    loading = true;
    update();
    await CashHelper.init();
    if (await CashHelper.contain(key: 'showOnBoard') ?? false) {
      if (await CashHelper.getData(key: 'showOnBoard')) {
        showOnBoard = true;
        await CashHelper.saveData(key: 'showOnBoard', value: false);

        update();
      } else {
        showOnBoard = false;
        update();
      }
    } else {
      showOnBoard = true;
      await CashHelper.saveData(key: 'showOnBoard', value: false);

      update();
    }
    await CashHelper.init();
    await CashHelper.getLogin().then((loginId) async {
      id = loginId ?? -1;
      if (loginId! != -1) {
      } else {
        loginStatus = false;
        update();
      }

      loading = false;
      update();
    });
    return id;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> logOut() async {
    await CashHelper.logout().then((value) {});
    return true;
  }

  login(user) async {}

  updateUser() {
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///-----------End Transaction Type-----------
}

enum StationFocusNode { moneyValue, notes, success }

enum TransactionTypes {
  PurchasesBill, //2
  ReturnPurchasesBill, //4
  POS, //8
  ReturnPOS //9
}
