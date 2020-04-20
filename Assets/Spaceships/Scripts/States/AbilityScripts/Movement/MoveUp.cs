using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/MoveUp")]
    public class MoveUp : StateData
    {
        public bool justUpdatePhysic = false;
        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            if (justUpdatePhysic && characterState.CharacterControl.moveUp)
            {
                characterState.CharacterControl.MoveUp();
                return;
            }
            if (characterState.CharacterControl.moveUp)
            {
                animator.SetBool(HashManager.Instance.MoveUpId, true);
                characterState.CharacterControl.MoveUp();
            }
            else
            {
                animator.SetBool(HashManager.Instance.MoveUpId, false);
            }
        }
    }
}