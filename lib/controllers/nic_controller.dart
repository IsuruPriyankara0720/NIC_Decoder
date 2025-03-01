import 'package:get/get.dart';
import '../models/nic_model.dart';
import '../utils/nic_decoder.dart';

// Controller to manage NIC decoding logic
class NICController extends GetxController {
  var nicModel = NICModel().obs;

  // Method to decode NIC and update the model
  void decodeNIC(String nic) {
    nicModel.value = NICDecoder.decodeNIC(nic);
  }
}