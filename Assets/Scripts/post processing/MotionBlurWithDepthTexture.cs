using UnityEngine;
using System.Collections;

public class MotionBlurWithDepthTexture : PostEffectsBase
{
    public Shader motionBlurShader;
    private Material motionBlurMaterial = null;

    public Material material
    {
        get
        {
            motionBlurMaterial = CheckShaderAndCreateMaterial(motionBlurShader, motionBlurMaterial);
            return motionBlurMaterial;
        }
    }

    private Camera myCamera;

    public Camera camera
    {
        get
        {
            if (myCamera == null)
            {
                myCamera = GetComponent<Camera>();
            }

            return myCamera;
        }
    }

    [Range(0.0f, 1.0f)] public float blurSize = 0.5f;

    private Matrix4x4 previousViewProjectionMatrix;

    void OnEnable()
    {
        camera.depthTextureMode |= DepthTextureMode.Depth;

        previousViewProjectionMatrix = camera.projectionMatrix * camera.worldToCameraMatrix;
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (material != null)
        {
            //计算和传递运动模糊使用的各个属性
            material.SetFloat("_BlurSize", blurSize);
            material.SetMatrix("_PreviousViewProjectionMatrix", previousViewProjectionMatrix);
            //通过调用camera.worldToCameraMatrix和 camera.projectionMatrix来分别得到当前摄像机的视角矩阵和投影矩阵，对它们相乘后
            Matrix4x4 currentViewProjectionMatrix = camera.projectionMatrix * camera.worldToCameraMatrix;
            //取逆，得到当前帧的视角*投影矩阵的逆矩阵
            Matrix4x4 currentViewProjectionInverseMatrix = currentViewProjectionMatrix.inverse;
            //并传递给材质
            material.SetMatrix("_CurrentViewProjectionInverseMatrix", currentViewProjectionInverseMatrix);
            //我们把取逆前的结果存储在previousViewProjectionMatrix变量中，以便在下一帧时传递给材质的_PreviousViewProjectionMatrix属性
            previousViewProjectionMatrix = currentViewProjectionMatrix;

            Graphics.Blit(src, dest, material);
        }
        else
        {
            Graphics.Blit(src, dest);
        }
    }
}