import 'package:mobx/mobx.dart';
import 'package:sigaamobile/screens/home/index.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  double offset;

  @action
  changeOffset(double offsetTemp) {
    offset = offsetTemp;
  }

  double scrollPosition(double expandedHeight) {
    double res = expandedHeight;
    if (offset != null) {
      if (offset < (res - kToolbarHeight)) {
        res -= offset;
      } else {
        res = kToolbarHeight;
      }
    }
    return res == kToolbarHeight ? 0 : res;
  }
}
