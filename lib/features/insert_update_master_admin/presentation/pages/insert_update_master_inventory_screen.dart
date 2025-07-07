import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/insert_update_product_model.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/data/model/response_insert_update_model.dart';
import 'package:employee_ni_service/features/insert_update_master_admin/presentation/bloc/master_inventory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/app_transition.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../assign_product_by_admin/data/models/model_master_inventory.dart';
import '../widgets/master_inventory_form.dart';

class InsertUpdateMasterInventoryScreen extends StatefulWidget {
  const InsertUpdateMasterInventoryScreen({super.key});

  @override
  State<InsertUpdateMasterInventoryScreen> createState() =>
      _InsertUpdateMasterInventoryScreenState();

  static Route route() {
    return createSlideTransitionRoute(
        const InsertUpdateMasterInventoryScreen());
  }
}

class _InsertUpdateMasterInventoryScreenState
    extends State<InsertUpdateMasterInventoryScreen> {
  ModelMasterInventory? masterInventory;
  final GlobalKey<MasterInventoryFormState> formKey =
      GlobalKey<MasterInventoryFormState>();

  @override
  void initState() {
    context.read<MasterInventoryBloc>().add(GetAllMasterInventory());
    super.initState();
  }

  void onSubmit(
    String? selectedProductId,
    String? newProductName,
    int quantity,
    double price,
    String? productCode,
  ) {
    final requestInsertUpdateInventory = InsertUpdateProductModel(
        productName: newProductName!,
        totalQuantity: quantity,
        productCode: productCode!,
        price: price,
        productId: selectedProductId);
    context
        .read<MasterInventoryBloc>()
        .add(InsertUpdateMasterInventory(requestInsertUpdateInventory));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Add/Update Inventory",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<MasterInventoryBloc, MasterInventoryState>(
          listener: (context, state) {
            if (state is MasterInventoryFailure) {
              showSnackBar(context, state.message);
            } else if (state is MasterInventorySuccess<ModelMasterInventory>) {
              masterInventory = state.data;
            } else if (state
                is MasterInventorySuccess<ResponseInsertUpdateModel>) {
              showSnackBar(context, state.data.message);
              formKey.currentState?.resetForm();
            }
          },
          builder: (context, state) {
            if (state is MasterInventoryLoading) {
              return const Loader();
            }
            return MasterInventoryForm(
              inventoryItems: masterInventory,
              onSubmit: onSubmit,
            );
          },
        ),
      ),
    );
  }
}
