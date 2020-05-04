using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveDown")]
    public class MoveDown : StateData
    {
        public bool justUpdatePhysic = false;

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            if (justUpdatePhysic && characterState.CharacterControl.moveDown)
            {
                characterState.CharacterControl.MoveDown();
                return;
            }
            if (characterState.CharacterControl.moveDown)
            {
                animator.SetBool(HashManager.Instance.MoveDownId, true);
                characterState.CharacterControl.MoveDown();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveDownId, false);
            }
        }
    }
}