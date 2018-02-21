Shader "Unlit Master"
{
	Properties
	{
				[NoScaleOffset] Texture_7C197F9A("_MainTex", 2D) = "white" {}
				[NoScaleOffset] Texture_14A16C66("_SubTex", 2D) = "white" {}
	}
	SubShader
	{
		Tags{ "RenderType" = "Opaque" "RenderPipeline" = "LightweightPipeline"}
		Pass
		{
			Tags{"LightMode" = "LightweightForward"}
					Tags
				{
					"RenderType"="Opaque"
					"Queue"="Geometry"
				}
		
					Blend One Zero
		
					Cull Back
		
					ZTest LEqual
		
					ZWrite On
		
			
			CGPROGRAM
			#pragma target 3.0
			#pragma multi_compile _ UNITY_SINGLE_PASS_STEREO STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON
		    #pragma multi_compile_fog
			#pragma multi_compile_instancing
		
			#pragma vertex vert
		    #pragma fragment frag
			#pragma glsl
			#pragma debug
		
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
								float3 Color;
								float Alpha;
							};
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
								float4 _SampleTexture2D_82F4AC3D_RGBA = UNITY_SAMPLE_TEX2D(Texture_7C197F9A,(_Sine_ABD18479_Out.xx));
								float _SampleTexture2D_82F4AC3D_R = _SampleTexture2D_82F4AC3D_RGBA.r;
								float _SampleTexture2D_82F4AC3D_G = _SampleTexture2D_82F4AC3D_RGBA.g;
								float _SampleTexture2D_82F4AC3D_B = _SampleTexture2D_82F4AC3D_RGBA.b;
								float _SampleTexture2D_82F4AC3D_A = _SampleTexture2D_82F4AC3D_RGBA.a;
								surface.Color = _SampleTexture2D_82F4AC3D_RGBA;
								surface.Alpha = _SampleTexture2D_82F4AC3D_A;
								return surface;
							}
		
		
		    struct GraphVertexOutput
		    {
		        float4 position : POSITION;
		        			float3 WorldSpaceNormal : TEXCOORD3;
					float3 WorldSpaceTangent : TEXCOORD4;
					float3 WorldSpaceBiTangent : TEXCOORD5;
					float3 WorldSpaceViewDirection : TEXCOORD6;
					float3 WorldSpacePosition : TEXCOORD7;
		
				UNITY_VERTEX_OUTPUT_STEREO
		    };
		
		    GraphVertexOutput vert (GraphVertexInput v)
			{
			    v = PopulateVertexData(v);
				
				UNITY_SETUP_INSTANCE_ID(v);
		
		        GraphVertexOutput o;
		        UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		        o.position = UnityObjectToClipPos(v.vertex);
		        			o.WorldSpaceNormal = mul(v.normal,(float3x3)unity_WorldToObject);
					o.WorldSpaceTangent = mul((float3x3)unity_ObjectToWorld,v.tangent);
					o.WorldSpaceBiTangent = normalize(cross(o.WorldSpaceNormal, o.WorldSpaceTangent.xyz) * v.tangent.w);
					o.WorldSpaceViewDirection = mul((float3x3)unity_ObjectToWorld,ObjSpaceViewDir(v.vertex));
					o.WorldSpacePosition = mul(unity_ObjectToWorld,v.vertex);
		
		        return o;
			}
		
		    fixed4 frag (GraphVertexOutput IN) : SV_Target
		    {
		    				float3 WorldSpaceNormal = normalize(IN.WorldSpaceNormal);
					float3 WorldSpaceTangent = IN.WorldSpaceTangent;
					float3 WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
					float3 WorldSpaceViewDirection = normalize(IN.WorldSpaceViewDirection);
					float3 WorldSpacePosition = IN.WorldSpacePosition;
		
		    	
		        SurfaceInputs surfaceInput;
		        
		
		        SurfaceDescription surf = PopulateSurfaceData(surfaceInput);
		        float3 Color = 0;
		        float Alpha = 0;
							Color = surf.Color;
					Alpha = surf.Alpha;
		
				
		    	return fixed4(Color, Alpha);
		    }
		    ENDCG
		}
	}
}
