using System;
using Spaceships.Scripts;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    private Transform firepoint;

    private CharacterControl _characterControl;
    // Update is called once per frame
    void Awake()
    {
        firepoint = transform.Find("FirePoint");
        _characterControl = GetComponent<CharacterControl>();
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            //get object via facing position
            var simpleProjectile = ObjectPool.SharedInstance.GetPooledObject();
            if (simpleProjectile != null)
            {
                simpleProjectile.transform.position = firepoint.position;
                simpleProjectile.transform.rotation = Quaternion.identity;
                //change angles for facing position
                if(_characterControl.faceLeft)
                    simpleProjectile.transform.eulerAngles = new Vector3(firepoint.position.x,180,firepoint.position.z);
                simpleProjectile.SetActive(true);
            }
        }
    }
}
