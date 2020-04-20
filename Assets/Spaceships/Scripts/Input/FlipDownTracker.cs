using UnityEngine;

namespace Spaceships.Scripts.Input
{
    public class FlipDownTracker : KeyTracker
    {
        public KeyCode keyCode;
        public override KeyCode GetKeyCode()
        {
            return keyCode;
        }

        public override void KeyDoubleTapped(CharacterControl characterControl)
        {
            characterControl.flipDown = true;
        }

        public override void KeyNotDoubleTapped(CharacterControl characterControl)
        {
            characterControl.flipDown = false;
        }
    }
}

