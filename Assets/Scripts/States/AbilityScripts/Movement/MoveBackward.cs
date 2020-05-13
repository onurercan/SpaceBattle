using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveBackward")]
    public class MoveBackward : MovementBase
    {
        public bool justUpdatePhysic = false;

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            ControlFacing(characterState.CharacterControl);
            
            if (justUpdatePhysic && characterState.CharacterControl.moveBackward)
            {
                characterState.CharacterControl.MoveBackward();
                return;
            }
            if (characterState.CharacterControl.moveBackward)
            {
                animator.SetBool(HashManager.Instance.MoveBackwardId, true);
                characterState.CharacterControl.MoveBackward();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveBackwardId, false);
            }
        }
    }
}