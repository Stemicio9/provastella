

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/empolyes_repository.dart';

class EmployeesCubit extends Cubit<EmployeListState> {
  EmployeesCubit() : super(EmployeListLoading());


   Future<void> fetchEmployes() async {
    emit(EmployeListLoading());

    print("CHIAMO LA FETCH");
    try {
      var response = await EmployesRepository().fetchAllEmployes();
      // here call mapping functions
      if(response.isEmpty){
        emit(EmployeEmptyList());
      }else {
        emit(EmployeListLoaded(response));
      }
    }catch(e){
      emit(EmployeListError(e.toString()));
    }

  }

}




class EmployeListState{}

class EmployeListLoading extends EmployeListState{}

class EmployeListLoaded extends EmployeListState{
  final List<dynamic> employees;

  EmployeListLoaded(this.employees);
}

class EmployeListError extends EmployeListState{
  final String message;

  EmployeListError(this.message);
}

class EmployeEmptyList extends EmployeListState{}