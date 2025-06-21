class ApiUrls {
  static const baseUrl = 'http://13.49.111.133:3000/';
  static const login = '${baseUrl}login';
  static const updateCustomerPassword = '${baseUrl}update-employee-password';
  static const getHomeDetails = '${baseUrl}get-admin-dashboard-details';
  static const getComplaintDetails = '${baseUrl}get-all-complaints';
  static const getClosedComplaintDetails = '${baseUrl}get-all-close-complaints';
  static const getActiveComplaintDetails = '${baseUrl}get-all-open-complaints';
  static const fetchEmployeeDetails = '${baseUrl}fetch-employee';
  static const getActiveCalibrationDetails =
      '${baseUrl}get-open-calibration-request-list';
  static const getClosedCalibrationDetails =
      '${baseUrl}get-close-calibration-request-list';
  static const getAllCalibrationDetails = '${baseUrl}get-my-calibration-list';
  static const getCylinderDetails = '${baseUrl}get-cylinder-details';
  static const updateCylinderDetails = '${baseUrl}update-cylinder-details';
  static const deleteCalibrationItem = '${baseUrl}delete-calibration-request';
  static const generateSendCalibrationItem =
      '${baseUrl}generate-send-calibration';
  static const addMachine = '${baseUrl}insert-machine-details';
  static const closeComplaintItem = '${baseUrl}close-service-request';
  static const assignComplaints = '${baseUrl}assign-complaint';
  static const getEmployeeDetails = '${baseUrl}get-employee-details';
  static const getAssignedComplaint = '${baseUrl}get-assigned-complaints';
  static const getFSRList = '${baseUrl}fsr-list';
  static const fetchMasterInventory = '${baseUrl}fetch-master-inventory';
  static const sendVerificationCode = '${baseUrl}send-verification-code';
  static const sendOTP = '${baseUrl}verify-otp';
  static const createFSR = '${baseUrl}create-fsr';
  static const insertUpdateMaster = '${baseUrl}insert-update-master-inventory';
  static const getAssignedProductInventory =
      '${baseUrl}employee-inventory-list';
  static const assignedProductToEmp =
      '${baseUrl}insert-update-employee-inventory';
  static const createEmployee = '${baseUrl}create-employee';
  static const deleteEmployee = '${baseUrl}delete-employee';
}
