using System.Collections.Generic;
using Spaceships.Scripts.Base;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.States.AbilityScripts.TransitionIndexer
{
    [CreateAssetMenu(fileName = "New State", menuName = "SpaceBattle/AbilityData/TransitionIndexer")]
    public class TransitionIndexer : StateData
    {
        public int index;
        public List<TransitionCondition> transitionConditions = new List<TransitionCondition>();

        public override void UpdateAbility(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            foreach (var item in transitionConditions)
            {
                switch (item)
                {
                    case TransitionCondition.FlipUp:
                        if (characterState.CharacterControl.flipUp)
                        {
                            animator.SetInteger(HashManager.Instance.TransitionIndexId,index);
                        }
                        break;
                    case TransitionCondition.FlipDown:
                        if (characterState.CharacterControl.flipDown)
                        {
                            animator.SetInteger(HashManager.Instance.TransitionIndexId,index);
                        }
                        break;
                }
            }
        }
    }
}
