using System;
using UnityEngine;

namespace Spaceships.Scripts.Input
{
    [Serializable]
    public abstract class KeyTracker : MonoBehaviour
    {
        public float keyPressDelayTime = 0.35f;
        private float _lastKeyPressed = 0;
        private int _keyPressed = 0;
        public abstract KeyCode GetKeyCode();
        public virtual void TrackKey(CharacterControl characterControl)
        {
            if (UnityEngine.Input.GetKeyDown(GetKeyCode()))
            {
                _keyPressed += 1;
                _lastKeyPressed = Time.time;
            }
        
            if (_keyPressed == 2 && Time.time - _lastKeyPressed < keyPressDelayTime)
            {
                KeyDoubleTapped(characterControl);
            }

            if (!(Time.time - _lastKeyPressed > keyPressDelayTime)) 
                return;
        
            _keyPressed = 0;
            _lastKeyPressed = 0;
            KeyNotDoubleTapped(characterControl);
        }

        public abstract void KeyDoubleTapped(CharacterControl characterControl);
        public abstract void KeyNotDoubleTapped(CharacterControl characterControl);

    }
}
