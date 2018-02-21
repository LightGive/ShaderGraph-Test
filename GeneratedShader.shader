Shader "Unlit Master"
{
	Properties
	{
				[NoScaleOffset] Texture_291687E0("RuleTexture", 2D) = "white" {}
				[NoScaleOffset] Texture_14DCDDF9("RuleTexture2", 2D) = "white" {}
				Vector1_C66C8C5F("Lerp", Range(0, 1)) = 0.5
				Color_BE0AC573("Color", Color) = (1,1,1,0.3372549)
		
	}
	SubShader
	{
		Tags{ "RenderType" = "Opaque" "RenderPipeline" = "LightweightPipeline"}
		Tags
		{
			"RenderType"="Opaque"
			"Queue"="Geometry"
		}
		
		Pass
		{
			Tags{"LightMode" = "LightweightForward"}
			
					Blend One Zero
		
					Cull Back
		
					ZTest LEqual
		
					ZWrite On
		
			
		    HLSLPROGRAM
		    // Required to compile gles 2.0 with standard srp library
		    #pragma prefer_hlslcc gles
		    #pragma vertex vert
		    #pragma fragment frag
		    #pragma multi_compile _ UNITY_SINGLE_PASS_STEREO STEREO_INSTANCING_ENABLE STEREO_MULTIVIEW_ENABLE
		    #pragma multi_compile_fog
		    #pragma shader_feature _SAMPLE_GI
		    #pragma shader_feature _ _ALPHATEST_ON _ALPHABLEND_ON
		    #pragma multi_compile_instancing
		
			#pragma vertex vert
		    #pragma fragment frag
		
		    // Lighting include is needed because of GI
		    #include "LWRP/ShaderLibrary/Core.hlsl"
		    #include "LWRP/ShaderLibrary/Lighting.hlsl"
		    #include "CoreRP/ShaderLibrary/Color.hlsl"
		    #include "LWRP/ShaderLibrary/InputSurface.hlsl"
		    #include "ShaderGraphLibrary/Functions.hlsl"
		
		    			#define _AlphaClip 1
		
		
		    					TEXTURE2D(Texture_291687E0); SAMPLER(samplerTexture_291687E0);
							TEXTURE2D(Texture_14DCDDF9); SAMPLER(samplerTexture_14DCDDF9);
							float Vector1_C66C8C5F;
							float4 Color_BE0AC573;
							float4 _SampleTexture2D_3AD50D6A_UV;
							float4 _SampleTexture2D_12DDFADF_UV;
							float _UnlitMaster_2B87A01D_Alpha;
					
							struct SurfaceInputs{
								half4 uv0;
							};
					
					
					        void Unity_Step_float4(float4 A, float4 B, out float4 Out)
					        {
					            Out = step(A, B);
					        }
					
					        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
					        {
					            Out = A + B;
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
								float3 Color;
								float Alpha;
								float AlphaClipThreshold;
							};
					
							GraphVertexInput PopulateVertexData(GraphVertexInput v){
								return v;
							}
					
							SurfaceDescription PopulateSurfaceData(SurfaceInputs IN) {
								SurfaceDescription surface = (SurfaceDescription)0;
								float4 _Property_C4D3517C_Out = Color_BE0AC573;
								float4 _SampleTexture2D_3AD50D6A_RGBA = SAMPLE_TEXTURE2D(Texture_291687E0, samplerTexture_291687E0, IN.uv0.xy);
								float _SampleTexture2D_3AD50D6A_R = _SampleTexture2D_3AD50D6A_RGBA.r;
								float _SampleTexture2D_3AD50D6A_G = _SampleTexture2D_3AD50D6A_RGBA.g;
								float _SampleTexture2D_3AD50D6A_B = _SampleTexture2D_3AD50D6A_RGBA.b;
								float _SampleTexture2D_3AD50D6A_A = _SampleTexture2D_3AD50D6A_RGBA.a;
								float _Property_25B71B3A_Out = Vector1_C66C8C5F;
								float4 _Step_5342BEEB_Out;
								Unity_Step_float4(_SampleTexture2D_3AD50D6A_RGBA, (_Property_25B71B3A_Out.xxxx), _Step_5342BEEB_Out);
								float4 _SampleTexture2D_12DDFADF_RGBA = SAMPLE_TEXTURE2D(Texture_14DCDDF9, samplerTexture_14DCDDF9, IN.uv0.xy);
								float _SampleTexture2D_12DDFADF_R = _SampleTexture2D_12DDFADF_RGBA.r;
								float _SampleTexture2D_12DDFADF_G = _SampleTexture2D_12DDFADF_RGBA.g;
								float _SampleTexture2D_12DDFADF_B = _SampleTexture2D_12DDFADF_RGBA.b;
								float _SampleTexture2D_12DDFADF_A = _SampleTexture2D_12DDFADF_RGBA.a;
								float4 _Step_EFA13478_Out;
								Unity_Step_float4(_SampleTexture2D_12DDFADF_RGBA, (_Property_25B71B3A_Out.xxxx), _Step_EFA13478_Out);
								float4 _Add_60C91261_Out;
								Unity_Add_float4(_Step_5342BEEB_Out, _Step_EFA13478_Out, _Add_60C91261_Out);
								surface.Color = (_Property_C4D3517C_Out.xyz);
								surface.Alpha = _UnlitMaster_2B87A01D_Alpha;
								surface.AlphaClipThreshold = (_Add_60C91261_Out).x;
								return surface;
							}
					
		
		
		    struct GraphVertexOutput
		    {
		        float4 position : POSITION;
		        			half4 uv0 : TEXCOORD3;
		
		        UNITY_VERTEX_INPUT_INSTANCE_ID
		    };
		
		    GraphVertexOutput vert (GraphVertexInput v)
			{
			    v = PopulateVertexData(v);
				
		        GraphVertexOutput o = (GraphVertexOutput)0;
		        
		        UNITY_SETUP_INSTANCE_ID(v);
		        UNITY_TRANSFER_INSTANCE_ID(v, o);
		
		        o.position = TransformObjectToHClip(v.vertex.xyz);
		        			o.uv0 = v.texcoord0;
		
		        return o;
			}
		
		    half4 frag (GraphVertexOutput IN) : SV_Target
		    {
		        UNITY_SETUP_INSTANCE_ID(IN);
		
		    				float4 uv0 = IN.uv0;
		
		    	
		        SurfaceInputs surfaceInput = (SurfaceInputs)0;
		        			surfaceInput.uv0 = uv0;
		
		
		        SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
		        float3 Color = float3(0.5, 0.5, 0.5);
		        float Alpha = 1;
		        float AlphaClipThreshold = 0;
							Color = surf.Color;
					Alpha = surf.Alpha;
					AlphaClipThreshold = surf.AlphaClipThreshold;
		
				
		 #if _AlphaClip
		        clip(Alpha - AlphaClipThreshold);
		#endif
		    	return half4(Color, Alpha);
		    }
		    ENDHLSL
		}
		
	}
	
}
