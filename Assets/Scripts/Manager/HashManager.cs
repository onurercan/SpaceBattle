using UnityEngine;

namespace Spaceships.Scripts.Manager
{
    public class HashManager : Singleton<HashManager>
    {
        public void Awake()
        {
            MoveUpId = Animator.StringToHash("MoveUp");
            MoveDownId = Animator.StringToHash("MoveDown");
            MoveForwardId = Animator.StringToHash("MoveForward");
            MoveBackwardId = Animator.StringToHash("MoveBackward");
            TransitionIndexId = Animator.StringToHash("TransitionIndex");
        }

        public int MoveForwardId { get; private set; }

        public int MoveDownId { get; private set; }

        public int MoveUpId { get; private set; }
        public int MoveBackwardId { get;private set; }
        public int TransitionIndexId { get; private set; }
    }
}