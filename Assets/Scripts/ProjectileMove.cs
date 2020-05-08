using System;
using System.Collections;
using System.Collections.Generic;
using Scenes;
using UnityEngine;

public class ProjectileMove : MonoBehaviour
{
    public float movementSpeed = 200;
    private ScreenBoundariesOrthographic _screenBoundaries;
    public float projectTileLength = 4f;

    private void Awake()
    {
        _screenBoundaries = Camera.main.GetComponent<ScreenBoundariesOrthographic>();
    }

    void FixedUpdate()
    {
        transform.Translate(Vector3.forward * movementSpeed * Time.deltaTime);

        if (transform.position.z > _screenBoundaries.clampMaxZ + projectTileLength || 
            transform.position.z  < _screenBoundaries.clampMinZ - projectTileLength)
        {
            gameObject.SetActive(false);
        }
    }
}