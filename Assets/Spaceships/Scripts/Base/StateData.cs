using UnityEngine;

namespace Spaceships.Scripts.Base
{
  public abstract class StateData : ScriptableObject
  {
    public virtual void OnEnter(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
    {
      
    }
    public abstract void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo);

    public virtual void OnExit(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
    {
      
    }
  }
}

