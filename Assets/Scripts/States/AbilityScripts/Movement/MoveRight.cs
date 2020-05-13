using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveForward")]
    public class MoveRight : MovementBase
    {
        public bool justUpdatePhysic = false;

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            ControlFacing(characterState.CharacterControl);
            
            if (justUpdatePhysic && characterState.CharacterControl.moveRight)
            {
                characterState.CharacterControl.MoveRight();
                return;
            }
            if (characterState.CharacterControl.moveRight)
            {
                animator.SetBool(HashManager.Instance.MoveRightId, true);
                characterState.CharacterControl.MoveRight();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveRightId, false);
            }
        }
    }
}