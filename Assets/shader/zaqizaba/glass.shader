Shader "glass"
{

    Properties
    {
        _Color ("主颜色", Color) = (1,1,1,0)

        _SpecColor("高光颜色",Color) = (1,1,1,1)

        _Emission("光泽颜色",Color) = (0,0,0,0)

        _Shininess("光泽度",Range(0.01,1)) = 0.7

        _MainTex ("主纹理 (RGB)", 2D) = "white" {}
    }

    SubShader
    {

        //材质

        Material
        {

            //漫反射

            Diffuse[_Color]

            //环境光颜色

            Ambient[_Color]

            //高光颜色

            Specular[_SpecColor]

            //光泽颜色

            Emission[_Emission]

            //光泽度

            Shininess[_Shininess]

        }

        //开启光照
        Lighting On

        //开启独立镜面反射
        SeparateSpecular On

        //开启透明度混合
        Blend SrcAlpha OneMinusSrcAlpha

        //通道一
        //说明：渲染对象的背面部分
        Pass
        {

            //如果对象是凸型，那么总是离镜头离得比前面的更远

            Cull Front //不绘制观察者的几何面

            SetTexture[_MainTex]{

            Combine Primary * Texture

            }
        }
        //通道二
        //说明：渲染对象背对我们的部分
        Pass
        {

            //如果对象是凸型,那么总是离镜头离得比背面更远

            Cull Back //不绘制背离观察者的几何面

            SetTexture[_MainTex]{

            Combine Primary * Texture

            }

        }

    }
}