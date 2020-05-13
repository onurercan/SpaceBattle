using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveBackward")]
    public class MoveLeft : MovementBase
    {
        public bool justUpdatePhysic = false;

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            ControlFacing(characterState.CharacterControl);
            
            if (justUpdatePhysic && characterState.CharacterControl.moveLeft)
            {
                characterState.CharacterControl.MoveLeft();
                return;
            }
            if (characterState.CharacterControl.moveLeft)
            {
                animator.SetBool(HashManager.Instance.MoveLeftId, true);
                characterState.CharacterControl.MoveLeft();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveLeftId, false);
            }
        }
    }
}