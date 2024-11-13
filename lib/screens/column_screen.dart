import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/service_locator.dart';
import '../view_models/column_viewmodel.dart';

class ColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<ColumnViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Column with MVVM and DI'),
        ),
        body: Consumer<ColumnViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List of Items:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Dynamically create a list of widgets based on the items in the ViewModel
                  ...viewModel.items.map((item) {
                    return ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          viewModel.removeItem(item);  // Remove item from the list
                        },
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.addItem("Item ${viewModel.items.length + 1}");  // Add new item
                    },
                    child: Text("Add Item"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.updateItem(0, "Updated Item");  // Update first item
                    },
                    child: Text("Update First Item"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
