using UnityEditor;
using UnityEngine;

namespace Scenes
{
    //https://www.youtube.com/watch?v=ailbszpt_AI
    public class ScreenBoundariesOrthographic : MonoBehaviour
    {
        private Vector3 _screenBounds;
        private float _objectWidth, _objectHeight;
        public GameObject player;
 
        void Start () {
            if (Camera.main != null)
                _screenBounds =
                    Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height,
                        Camera.main.transform.position.z));
            _objectWidth = player.transform.GetComponent<BoxCollider>().bounds.extents.z; //extents = size of width / 2
            _objectHeight = player.transform.GetComponent<BoxCollider>().bounds.extents.y; //extents = size of height / 2
        }
        void LateUpdate(){
             Vector3 viewPos = player.transform.position;
             viewPos.z = Mathf.Clamp(viewPos.z, _screenBounds.z * -1 + _objectWidth, _screenBounds.z - _objectWidth);
             viewPos.y = Mathf.Clamp(viewPos.y, _screenBounds.y * -1 + _objectHeight, _screenBounds.y - _objectHeight);
             player.transform.position = viewPos;
        }
    }
}
