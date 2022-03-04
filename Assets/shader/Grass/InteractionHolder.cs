using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class InteractionHolder : MonoBehaviour
{
    [SerializeField] GameObject[] objects;
    Vector4[] positions = new Vector4[100];

    // Update is called once per frame
    void Update()
    {
        for (int i = 0; i < objects.Length; i++)
        {
            positions[i] = objects[i].transform.position;
        }

        Shader.SetGlobalFloat("_PositionArray", objects.Length);
        Shader.SetGlobalVectorArray("_Positions", positions);
    }
}