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
        public float clampMinZ,clampMaxZ,clamMinY, clamMaxY;
 
        void Start () {
            if (Camera.main != null)
                _screenBounds =
                    Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height,
                        Camera.main.transform.position.z));
            
            var boxCollider = player.transform.GetComponent<BoxCollider>();
            var bounds = boxCollider.bounds;
            _objectWidth = bounds.extents.z; //extents = size of width / 2
            _objectHeight = bounds.extents.y; //extents = size of height / 2
            
            Destroy(boxCollider);

            clampMinZ = _screenBounds.z * -1 + _objectWidth;
            clampMaxZ = _screenBounds.z - _objectWidth;
            clamMinY = _screenBounds.y * -1 + _objectHeight;
            clamMaxY = _screenBounds.y - _objectHeight;
        }
        void LateUpdate(){
             Vector3 viewPos = player.transform.position;
             viewPos.z = Mathf.Clamp(viewPos.z, clampMinZ, clampMaxZ);
             viewPos.y = Mathf.Clamp(viewPos.y, clamMinY, clamMaxY);
             player.transform.position = viewPos;
        }
    }
}
