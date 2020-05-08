using System;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    private Transform firepoint;

    public GameObject projectile;
    // Update is called once per frame
    void Awake()
    {
        firepoint = transform.Find("FirePoint");
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            var simpleProjectile = ObjectPool.SharedInstance.GetPooledObject();
            if (simpleProjectile != null)
            {
                simpleProjectile.transform.position = firepoint.position;
                simpleProjectile.transform.rotation = Quaternion.identity;
                simpleProjectile.SetActive(true);
            }
        }
    }
}
