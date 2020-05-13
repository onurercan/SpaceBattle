using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveForward")]
    public class MoveForward : MovementBase
    {
        public bool justUpdatePhysic = false;

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            ControlFacing(characterState.CharacterControl);
            
            if (justUpdatePhysic && characterState.CharacterControl.moveForward)
            {
                characterState.CharacterControl.MoveForward();
                return;
            }
            if (characterState.CharacterControl.moveForward)
            {
                animator.SetBool(HashManager.Instance.MoveForwardId, true);
                characterState.CharacterControl.MoveForward();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveForwardId, false);
            }
        }
    }
}