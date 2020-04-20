using System;
using System.Collections.Generic;
using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.Input
{
    [Serializable]
    public class ManuelInput : MonoBehaviour
    {
        public CharacterControl CharacterControl { get; set; }
        public List<KeyTracker> keyTrackers;

        // Start is called before the first frame update
        void Awake()
        {
            CharacterControl = gameObject.GetComponent<CharacterControl>();
        }


        // Update is called once per frame
        void Update()
        {
            CharacterControl.moveBackward = VirtualInputManager.Instance.moveBackward;
            CharacterControl.moveForward = VirtualInputManager.Instance.moveForward;
            CharacterControl.moveDown = VirtualInputManager.Instance.moveDown;
            CharacterControl.moveUp = VirtualInputManager.Instance.moveUp;
        
            foreach(var item in keyTrackers)
                item.TrackKey(CharacterControl);
        
        }
    }
}