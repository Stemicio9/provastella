import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/emplyees_cubit.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                fetchEmployees(context);
              },
              child: const Text('Fetch Employees'),
            ),
          ),
        ),
         BlocBuilder<EmployeesCubit,EmployeListState>(
            builder: (_,state){
              if(state is EmployeListLoading){
                return const CircularProgressIndicator();
              }else if(state is EmployeListLoaded){
                return loadedState(state.employees);
              }else if(state is EmployeEmptyList){
                return emptyAndErrorState(context);
              }else{
                // here we are in error state
                return  emptyAndErrorState(context);
              }
            },
          )

      ],
    );
  }


  Widget emptyAndErrorState(BuildContext context){
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error'),
          ElevatedButton(
            onPressed: () {
              fetchEmployees(context);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  void fetchEmployees(BuildContext context){
    EmployeesCubit employesCubit = context.read<EmployeesCubit>();
    employesCubit.fetchEmployes();
  }


  Widget loadedState(List<dynamic> employees){
    return Expanded(
      child: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (_,position){
        return ListTile(
          title: Text(employees[position]['title']),
          subtitle: Text(employees[position]['description']),
        );
      }
      ),
    );
  }
}
