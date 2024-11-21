class ApiUrls {
  static const baseUrl = 'http://16.170.250.91:3000/';
  static const login = '${baseUrl}login';
  static const updateCustomerPassword = '${baseUrl}update-customer-password';
  static const getHomeDetails = '${baseUrl}get-admin-dashboard-details';
  static const getComplaintDetails = '${baseUrl}get-all-complaints';
  static const getCalibrationDetails = '${baseUrl}get-calibration-request-list';
  static const getCylinderDetails = '${baseUrl}get-cylinder-details';
  static const updateCylinderDetails = '${baseUrl}update-cylinder-details';
  static const deleteCalibrationItem = '${baseUrl}delete-calibration-request';
  static const generateSendCalibrationItem =
      '${baseUrl}generate-send-calibration';
}
