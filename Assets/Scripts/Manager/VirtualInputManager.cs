using Spaceships.Scripts.Input;
using UnityEngine;

namespace Spaceships.Scripts.Manager
{
    public class VirtualInputManager : Singleton<VirtualInputManager>
    {
        public bool moveUp;
        public bool moveDown;
        public bool moveRight;
        public bool moveLeft;

        private PlayerInput _playerInput;


        private void Awake()
        {
            var obj = Instantiate(Resources.Load("PlayerInput", typeof(GameObject))) as GameObject;
            if (obj != null) _playerInput = obj.GetComponent<PlayerInput>();
        }
    }
}