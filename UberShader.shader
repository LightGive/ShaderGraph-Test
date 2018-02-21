Shader "hidden/preview"
{
	Properties
	{
				[NoScaleOffset] Texture_7C197F9A("_MainTex", 2D) = "white" {}
				[NoScaleOffset] Texture_14A16C66("_SubTex", 2D) = "white" {}
	}
	CGINCLUDE
	#include "UnityCG.cginc"
			void Unity_Sine_float(float In, out float Out)
			{
			    Out = sin(In);
			}
			struct GraphVertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct SurfaceInputs{
			};
			struct SurfaceDescription{
				float4 PreviewOutput;
			};
			float Float_34436B73;
			UNITY_DECLARE_TEX2D(Texture_7C197F9A);
			UNITY_DECLARE_TEX2D(Texture_14A16C66);
			float _Sine_ABD18479_In;
			GraphVertexInput PopulateVertexData(GraphVertexInput v){
				return v;
			}
			SurfaceDescription PopulateSurfaceData(SurfaceInputs IN) {
				SurfaceDescription surface = (SurfaceDescription)0;
				float _Sine_ABD18479_Out;
				Unity_Sine_float(_Sine_ABD18479_In, _Sine_ABD18479_Out);
				if (Float_34436B73 == 0) { surface.PreviewOutput = half4(_Sine_ABD18479_Out, _Sine_ABD18479_Out, _Sine_ABD18479_Out, 1.0); return surface; }
				float4 _SampleTexture2D_82F4AC3D_RGBA = UNITY_SAMPLE_TEX2D(Texture_7C197F9A,(_Sine_ABD18479_Out.xx));
				float _SampleTexture2D_82F4AC3D_R = _SampleTexture2D_82F4AC3D_RGBA.r;
				float _SampleTexture2D_82F4AC3D_G = _SampleTexture2D_82F4AC3D_RGBA.g;
				float _SampleTexture2D_82F4AC3D_B = _SampleTexture2D_82F4AC3D_RGBA.b;
				float _SampleTexture2D_82F4AC3D_A = _SampleTexture2D_82F4AC3D_RGBA.a;
				if (Float_34436B73 == 1) { surface.PreviewOutput = half4(_SampleTexture2D_82F4AC3D_RGBA.x, _SampleTexture2D_82F4AC3D_RGBA.y, _SampleTexture2D_82F4AC3D_RGBA.z, 1.0); return surface; }
				return surface;
			}
	ENDCG
	
	SubShader
	{
	    Tags { "RenderType"="Opaque" }
	    LOD 100
	
	    Pass
	    {
	        CGPROGRAM
	        #pragma vertex vert
	        #pragma fragment frag
	
	        #include "UnityCG.cginc"
	
	        struct GraphVertexOutput
	        {
	            float4 position : POSITION;
	            
	        };
	
	        GraphVertexOutput vert (GraphVertexInput v)
	        {
	            v = PopulateVertexData(v);
	
	            GraphVertexOutput o;
	            o.position = UnityObjectToClipPos(v.vertex);
	            
	            return o;
	        }
	
	        fixed4 frag (GraphVertexOutput IN) : SV_Target
	        {
	            
	
	            SurfaceInputs surfaceInput = (SurfaceInputs)0;;
	            
	
	            SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
	            return surf.PreviewOutput;
	
	        }
	        ENDCG
	    }
	}
}
