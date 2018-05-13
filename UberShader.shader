Shader "hidden/preview"
{
    Properties
    {
        [NoScaleOffset] Texture_291687E0("RuleTexture", 2D) = "white" {}
        [NoScaleOffset] Texture_14DCDDF9("RuleTexture2", 2D) = "white" {}
        Vector1_C66C8C5F("Lerp", Range(0, 1)) = 0.1
        Color_BE0AC573("Color", Color) = (1,1,1,0.3372549)
    }
    HLSLINCLUDE
    #define USE_LEGACY_UNITY_MATRIX_VARIABLES
    #include "CoreRP/ShaderLibrary/Common.hlsl"
    #include "CoreRP/ShaderLibrary/Packing.hlsl"
    #include "CoreRP/ShaderLibrary/Color.hlsl"
    #include "CoreRP/ShaderLibrary/UnityInstancing.hlsl"
    #include "CoreRP/ShaderLibrary/EntityLighting.hlsl"
    #include "ShaderGraphLibrary/ShaderVariables.hlsl"
    #include "ShaderGraphLibrary/ShaderVariablesFunctions.hlsl"
    #include "ShaderGraphLibrary/Functions.hlsl"
    float Vector1_D8D79A18;
    TEXTURE2D(Texture_291687E0); SAMPLER(samplerTexture_291687E0);
    TEXTURE2D(Texture_14DCDDF9); SAMPLER(samplerTexture_14DCDDF9);
    float Vector1_C66C8C5F;
    float4 Color_BE0AC573;
    float4 _SampleTexture2D_3AD50D6A_UV;
    float Vector1_DEFF42F5;
    float _Add_64C6842A_B;
    float4 _SampleTexture2D_12DDFADF_UV;
    float _Multiply_DA61AB8D_B;
    float _Clamp_64109F45_Min;
    float _Clamp_64109F45_Max;
    struct SurfaceInputs{
    	half4 uv0;
    };

    void Unity_Step_float4(float4 A, float4 B, out float4 Out)
    {
        Out = step(A, B);
    }

    void Unity_Add_float(float A, float B, out float Out)
    {
        Out = A + B;
    }

    void Unity_Multiply_float(float A, float B, out float Out)
    {
        Out = A * B;
    }

    void Unity_Add_float4(float4 A, float4 B, out float4 Out)
    {
        Out = A + B;
    }

    void Unity_Clamp_float(float In, float Min, float Max, out float Out)
    {
        Out = clamp(In, Min, Max);
    }
    struct GraphVertexInput
    {
    	float4 vertex : POSITION;
    	float3 normal : NORMAL;
    	float4 tangent : TANGENT;
    	float4 texcoord0 : TEXCOORD0;
    	UNITY_VERTEX_INPUT_INSTANCE_ID
    };
    struct SurfaceDescription{
    	float4 PreviewOutput;
    };
    GraphVertexInput PopulateVertexData(GraphVertexInput v){
    	return v;
    }
    SurfaceDescription PopulateSurfaceData(SurfaceInputs IN) {
    	SurfaceDescription surface = (SurfaceDescription)0;
    	float4 _SampleTexture2D_3AD50D6A_RGBA = SAMPLE_TEXTURE2D(Texture_291687E0, samplerTexture_291687E0, IN.uv0.xy);
    	float _SampleTexture2D_3AD50D6A_R = _SampleTexture2D_3AD50D6A_RGBA.r;
    	float _SampleTexture2D_3AD50D6A_G = _SampleTexture2D_3AD50D6A_RGBA.g;
    	float _SampleTexture2D_3AD50D6A_B = _SampleTexture2D_3AD50D6A_RGBA.b;
    	float _SampleTexture2D_3AD50D6A_A = _SampleTexture2D_3AD50D6A_RGBA.a;
    	if (Vector1_D8D79A18 == 1) { surface.PreviewOutput = half4(_SampleTexture2D_3AD50D6A_RGBA.x, _SampleTexture2D_3AD50D6A_RGBA.y, _SampleTexture2D_3AD50D6A_RGBA.z, 1.0); return surface; }
    	float4 _Step_5342BEEB_Out;
    	Unity_Step_float4(_SampleTexture2D_3AD50D6A_RGBA, (Vector1_DEFF42F5.xxxx), _Step_5342BEEB_Out);
    	if (Vector1_D8D79A18 == 3) { surface.PreviewOutput = half4(_Step_5342BEEB_Out.x, _Step_5342BEEB_Out.y, _Step_5342BEEB_Out.z, 1.0); return surface; }
    	float _Add_64C6842A_Out;
    	Unity_Add_float(_SinTime.w, _Add_64C6842A_B, _Add_64C6842A_Out);
    	if (Vector1_D8D79A18 == 4) { surface.PreviewOutput = half4(_Add_64C6842A_Out, _Add_64C6842A_Out, _Add_64C6842A_Out, 1.0); return surface; }
    	float4 _SampleTexture2D_12DDFADF_RGBA = SAMPLE_TEXTURE2D(Texture_14DCDDF9, samplerTexture_14DCDDF9, IN.uv0.xy);
    	float _SampleTexture2D_12DDFADF_R = _SampleTexture2D_12DDFADF_RGBA.r;
    	float _SampleTexture2D_12DDFADF_G = _SampleTexture2D_12DDFADF_RGBA.g;
    	float _SampleTexture2D_12DDFADF_B = _SampleTexture2D_12DDFADF_RGBA.b;
    	float _SampleTexture2D_12DDFADF_A = _SampleTexture2D_12DDFADF_RGBA.a;
    	if (Vector1_D8D79A18 == 6) { surface.PreviewOutput = half4(_SampleTexture2D_12DDFADF_RGBA.x, _SampleTexture2D_12DDFADF_RGBA.y, _SampleTexture2D_12DDFADF_RGBA.z, 1.0); return surface; }
    	float4 _Step_EFA13478_Out;
    	Unity_Step_float4(_SampleTexture2D_12DDFADF_RGBA, (Vector1_DEFF42F5.xxxx), _Step_EFA13478_Out);
    	if (Vector1_D8D79A18 == 8) { surface.PreviewOutput = half4(_Step_EFA13478_Out.x, _Step_EFA13478_Out.y, _Step_EFA13478_Out.z, 1.0); return surface; }
    	float _Multiply_DA61AB8D_Out;
    	Unity_Multiply_float(_Add_64C6842A_Out, _Multiply_DA61AB8D_B, _Multiply_DA61AB8D_Out);
    	if (Vector1_D8D79A18 == 9) { surface.PreviewOutput = half4(_Multiply_DA61AB8D_Out, _Multiply_DA61AB8D_Out, _Multiply_DA61AB8D_Out, 1.0); return surface; }
    	float4 _Add_60C91261_Out;
    	Unity_Add_float4(_Step_5342BEEB_Out, _Step_EFA13478_Out, _Add_60C91261_Out);
    	if (Vector1_D8D79A18 == 10) { surface.PreviewOutput = half4(_Add_60C91261_Out.x, _Add_60C91261_Out.y, _Add_60C91261_Out.z, 1.0); return surface; }
    	float _Clamp_64109F45_Out;
    	Unity_Clamp_float(_Multiply_DA61AB8D_Out, _Clamp_64109F45_Min, _Clamp_64109F45_Max, _Clamp_64109F45_Out);
    	if (Vector1_D8D79A18 == 12) { surface.PreviewOutput = half4(_Clamp_64109F45_Out, _Clamp_64109F45_Out, _Clamp_64109F45_Out, 1.0); return surface; }
    	float4 _Property_C4D3517C_Out = Color_BE0AC573;
    	return surface;
    }
    ENDHLSL

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct GraphVertexOutput
            {
                float4 position : POSITION;
                half4 uv0 : TEXCOORD;

            };

            GraphVertexOutput vert (GraphVertexInput v)
            {
                v = PopulateVertexData(v);

                GraphVertexOutput o;
                float3 positionWS = TransformObjectToWorld(v.vertex);
                o.position = TransformWorldToHClip(positionWS);
                o.uv0 = v.texcoord0;

                return o;
            }

            float4 frag (GraphVertexOutput IN) : SV_Target
            {
                float4 uv0 = IN.uv0;


                SurfaceInputs surfaceInput = (SurfaceInputs)0;;
                surfaceInput.uv0 = uv0;


                SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
                return surf.PreviewOutput;

            }
            ENDHLSL
        }
    }
}
