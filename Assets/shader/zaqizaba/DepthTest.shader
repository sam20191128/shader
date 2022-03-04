Shader "DepthTest" //Shader路径名
{
    Properties //材质面板参数
    {
        _MainTex("贴图",2D)="white"{}
    }

    SubShader
    {
        Pass
        {
            zwrite on       //打开深度缓存
            ztest greater   //打开深度测试，颜色通过
        }
        pass
        {
            SetTexture[_MainTex]
            {
            Combine texture*primary//正面赋予贴图
            }
        }
    }
    FallBack "Diffuse"
}