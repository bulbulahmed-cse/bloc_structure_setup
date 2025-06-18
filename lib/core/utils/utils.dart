import 'dart:ui';

import '../theme/app_colors.dart';



class Utils {

  Color getOrderStatusColor(String? status) {
    switch (status) {
      case 'completed':
        return AppColors.success;
      case 'processing':
        return AppColors.secondary;
      case 'on-hold':
        return AppColors.secondary;
      case 'pending':
        return AppColors.secondary;
      case 'cancelled':
        return AppColors.error;
      case 'refunded':
        return AppColors.success;
      case 'failed':
        return AppColors.error;
      default:
        return AppColors.gray;
    }
  }

}

