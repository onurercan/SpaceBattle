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
            Instantiate(projectile, firepoint.position, Quaternion.identity);
        }
    }
}
