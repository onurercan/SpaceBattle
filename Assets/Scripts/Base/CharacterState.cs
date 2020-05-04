using System;
using System.Collections.Generic;
using UnityEngine;

namespace Spaceships.Scripts.Base
{
    public class CharacterState : StateMachineBehaviour
    {
        [NonSerialized]
        public CharacterControl CharacterControl;
        [Space(10)]
        public List<StateData> listAbilityData = new List<StateData>();
         
        public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {
            if (CharacterControl == null)
            {
                CharacterControl = animator.transform.root.GetComponent<CharacterControl>();
                CharacterControl.CacheCharacterControl(animator);
            }

            foreach(var d in listAbilityData)
            {
                d.OnEnter(this, animator, stateInfo);
            }
        }

        private void UpdateAll(CharacterState characterState, Animator animator, AnimatorStateInfo stateInfo)
        {
            foreach(var d in listAbilityData)
            {
                d.UpdateAbility(characterState, animator, stateInfo);
            }
        }
        
        public override void OnStateUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {
            UpdateAll(this, animator, stateInfo);
        }

        public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {
            foreach (StateData d in listAbilityData)
            {
                d.OnExit(this, animator, stateInfo);
            }
        }
    }
}
