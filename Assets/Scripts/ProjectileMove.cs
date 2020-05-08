using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProjectileMove : MonoBehaviour
{
    public float movementSpeed = 200;

    void FixedUpdate()
    {
        transform.Translate(Vector3.forward * movementSpeed * Time.deltaTime);
    }
}