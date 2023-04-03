

abstract class DimaGoldLoginState{}
class DimaGoldLoginInitialStates extends DimaGoldLoginState{}
class DimaGoldLoginLoadingStates extends DimaGoldLoginState{}
class DimaGoldLoginSuccessStates extends DimaGoldLoginState{

  DimaGoldLoginSuccessStates();
}
class DimaGoldLoginErrortates extends DimaGoldLoginState
{
  final String error;
  DimaGoldLoginErrortates(this.error);
}
class DimaGoldChangePasswordVisibilityStates extends DimaGoldLoginState{}