using Spaceships.Scripts.Manager;
using UnityEngine;

namespace Spaceships.Scripts.Input
{
    public class PlayerInput : MonoBehaviour
    {
        void Update()
        {
            VirtualInputManager.Instance.moveUp = UnityEngine.Input.GetKey(KeyCode.W);
            VirtualInputManager.Instance.moveDown = UnityEngine.Input.GetKey(KeyCode.S);
            VirtualInputManager.Instance.moveForward = UnityEngine.Input.GetKey(KeyCode.D);
            VirtualInputManager.Instance.moveBackward = UnityEngine.Input.GetKey(KeyCode.A);
        }
    }
}