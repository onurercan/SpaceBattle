using System;
using UnityEngine;

namespace Spaceships.Scripts.Input
{
    [Serializable]

    public class FlipUpTracker : KeyTracker
    {
        public KeyCode keyCode;
        public override KeyCode GetKeyCode()
        {
            return keyCode;
        }

        public override void KeyDoubleTapped(CharacterControl characterControl)
        {
            characterControl.flipUp = true;
        }

        public override void KeyNotDoubleTapped(CharacterControl characterControl)
        {
            characterControl.flipUp = false;
        }
    }
}
