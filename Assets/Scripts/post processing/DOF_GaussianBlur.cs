using UnityEngine;
using System.Collections;

public class DOF_GaussianBlur : PostEffectsBase
{
    public Shader gaussianBlurShader;
    private Material gaussianBlurMaterial = null;

    public Material material
    {
        get
        {
            gaussianBlurMaterial = CheckShaderAndCreateMaterial(gaussianBlurShader, gaussianBlurMaterial);
            return gaussianBlurMaterial;
        }
    }

    //高斯模糊
    [Range(0.0f, 10f)] public float blurSize = 1f; //模糊强度
    [Range(1, 50)] public int iterations = 50; //迭代次数
    [Range(1, 8)] public int RTDownSample = 2; //像素大小

    //景深
    [Range(0, 10)] public float start = 0.1f;
    [Range(0, 10)] public float end = 4f;
    [Range(1, 10)] public float density = 10f;

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (material != null)
        {
            //散景模糊
            material.SetFloat("_Iteration", iterations);
            material.SetFloat("_BlurSize", blurSize);
            material.SetFloat("_DownSample", RTDownSample);
            //景深
            material.SetFloat("_Start", start);
            material.SetFloat("_End", end);
            material.SetFloat("_Density", density);

            //利用缩放对图像进行降采样
            int rtW = src.width / RTDownSample;
            int rtH = src.height / RTDownSample;

            //临时RT
            RenderTexture buffer0 = RenderTexture.GetTemporary(rtW, rtH, 0);
            //将该临时渲染纹理的滤波模式设置为双线性
            buffer0.filterMode = FilterMode.Bilinear;

            //源纹理到临时RT
            Graphics.Blit(src, buffer0, material, 0);

            //临时RT到目标纹理
            Graphics.Blit(buffer0, dest, material);
        }
        else
        {
            Graphics.Blit(src, dest);
        }
    }
}