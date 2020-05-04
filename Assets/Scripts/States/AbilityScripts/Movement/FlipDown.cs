using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/FlipDown")]
    public class FlipDown : StateData
    {
        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            characterState.CharacterControl.FlipDown();
        }

        public override void OnExit(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            animator.SetInteger(HashManager.Instance.TransitionIndexId, 0);
        }
    }
}
