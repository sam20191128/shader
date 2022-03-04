using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class zhanshi : MonoBehaviour
{
    public List<GameObject> objects = new List<GameObject>();
    public int curIndex;
    
    void Start()
    {
        curIndex=0;
        StartCoroutine(StartRotate());
    }
    
    void Update()
    {

    }

    IEnumerator StartRotate()
    {
        if (curIndex<=43)
        {
            GameObject go = Instantiate(objects[curIndex],transform.position,Quaternion.identity);
            Tweener rotateTweener = go.transform.DORotate(new Vector3(0,720,0),5f,RotateMode.FastBeyond360);
            yield return rotateTweener.WaitForKill();
            Destroy(go);
            curIndex++;
        }
        else
        {
            GameObject go = Instantiate(objects[curIndex], transform.position, Quaternion.identity);
            yield return new WaitForSeconds(5f);
            Destroy(go);
            curIndex++;
        }
        if (curIndex>objects.Count)
        {
            yield break;
        }
        else
        {
            StartCoroutine(StartRotate());
        }
    }
}
