using Spaceships.Scripts.Base;
using UnityEngine;

namespace Spaceships.Scripts
{
    public class CharacterControl : MonoBehaviour
    {
        [Header("Abilities")] 
        public bool moveBackward;
        public bool moveForward;
        public bool moveDown;
        public bool moveUp;
        public bool flipUp;
        public bool flipDown;

        [Header("Movement")] 
        public float speed = 25;
        public float flipForce = 55;

        private Rigidbody _rigidBody;

        private void Awake()
        {
            _rigidBody = GetComponent<Rigidbody>();
        }
        
        public void CacheCharacterControl(Animator animator)
        {
            var arr = animator.GetBehaviours<CharacterState>();

            foreach (var c in arr)
            {
                c.CharacterControl = this;
            }
        }

        public void MoveForward()
        {
            _rigidBody.AddForce(transform.forward * speed, ForceMode.Acceleration);
        }

        public void MoveBackward()
        {
            _rigidBody.AddForce(transform.forward * -speed, ForceMode.Acceleration);
        }

        public void MoveUp()
        {
            _rigidBody.AddForce(transform.up * speed, ForceMode.Acceleration);
        }

        public void MoveDown()
        {
            _rigidBody.AddForce(transform.up * -speed, ForceMode.Acceleration);
        }

        public void FlipUp()
        {
            //reset current velocity for unexpected slight
            _rigidBody.velocity = new Vector3(0,0,_rigidBody.velocity.z); 
            //https://www.youtube.com/watch?v=ViM_3sVb9-E
            //ignoring rigidbody physics because of animation rotation
            transform.position += Vector3.up * (flipForce * Time.deltaTime); 
        }

        public void FlipDown()
        {
            //reset current velocity for unexpected slight
            _rigidBody.velocity = new Vector3(0,0,_rigidBody.velocity.z);
            //https://www.youtube.com/watch?v=ViM_3sVb9-E
            //ignoring rigidbody physics because of animation rotation
            transform.position += Vector3.up * (-flipForce * Time.deltaTime);
        }
    }
}