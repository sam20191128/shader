using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace FrameworkDesign.Example
{
    public class Enemy : MonoBehaviour
    {
        public GameObject GamePassPanel;

        private static int mKilledEnemyCount = 0; 
        
        private void OnMouseDown()
        {
            //Destroy(gameObject);
            gameObject.SetActive(false);
            mKilledEnemyCount++;
            if (mKilledEnemyCount==9)
            {
                GamePassPanel.SetActive(true);
                mKilledEnemyCount = 0;
            }
        }
    }
}