using System.Collections;
using System.Collections.Generic;
using Spaceships.Scripts;
using Spaceships.Scripts.Input;
using UnityEngine;

public class FaceLeftTracker : KeyTracker
{
    
    public KeyCode keyCode;
    public override KeyCode GetKeyCode()
    {
        return keyCode;
    }

    public override void KeyDoubleTapped(CharacterControl characterControl)
    {
        characterControl.faceLeft = true;
    }

    public override void KeyNotDoubleTapped(CharacterControl characterControl)
    {
        
    }
}
