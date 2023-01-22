import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'currentcls_state.dart';

class CurrentclsCubit extends Cubit<CurrentclsState> {
  CurrentclsCubit() : super(CurrentclsState(selectedClass: ''));








  void selectClass (String clss){
    
      emit(CurrentclsState(selectedClass: clss));
    
  }
}
