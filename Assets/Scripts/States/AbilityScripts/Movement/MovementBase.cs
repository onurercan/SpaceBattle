using Spaceships.Scripts.Base;

namespace Spaceships.Scripts.States.AbilityScripts.Movement
{
    public class MovementBase : StateData
    {
        protected void ControlFacing(CharacterControl characterControl)
        {
            if(characterControl.faceLeft)
                characterControl.ChangeRotation(-180f);
            else 
                characterControl.ChangeRotation(0f);
        }
    }
}