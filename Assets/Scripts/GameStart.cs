using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameStart : MonoBehaviour
{
    public GameObject ob;
    
    public void shengcheng()
    {
        GameObject go = Instantiate(ob,transform.position,Quaternion.identity);
    }
}
