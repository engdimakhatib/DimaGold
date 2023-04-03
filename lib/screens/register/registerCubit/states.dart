

abstract class DimaGoldRegisterState{}
class DimaGoldRegisterInitialStates extends DimaGoldRegisterState{}
class DimaGoldRegisterLoadingStates extends DimaGoldRegisterState{}
class DimaGoldRegisterSuccessStates extends DimaGoldRegisterState{
}
class DimaGoldRegisterErrortates extends DimaGoldRegisterState
{
  final String error;
  DimaGoldRegisterErrortates(this.error);
}
class DimaGoldRegisterChangePasswordVisibilityStates extends DimaGoldRegisterState{}
