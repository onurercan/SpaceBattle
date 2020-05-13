using UnityEngine;

namespace Spaceships.Scripts.Manager
{
    public class HashManager : Singleton<HashManager>
    {
        public void Awake()
        {
            MoveUpId = Animator.StringToHash("MoveUp");
            MoveDownId = Animator.StringToHash("MoveDown");
            MoveRightId = Animator.StringToHash("MoveRight");
            MoveLeftId = Animator.StringToHash("MoveLeft");
            TransitionIndexId = Animator.StringToHash("TransitionIndex");
        }

        public int MoveRightId { get; private set; }

        public int MoveDownId { get; private set; }

        public int MoveUpId { get; private set; }
        public int MoveLeftId { get;private set; }
        public int TransitionIndexId { get; private set; }
    }
}