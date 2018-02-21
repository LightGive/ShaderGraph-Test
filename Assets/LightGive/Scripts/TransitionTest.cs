using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor.ShaderGraph;

public class TransitionTest : MonoBehaviour
{
	[SerializeField]
	private Material mainMat;

	void Start ()
	{
		
	}
	
	void Update ()
	{
		
	}

	public void SetLerp(float _lerp)
	{
		_lerp = Mathf.Clamp01(_lerp);
		mainMat.SetFloat("Vector1_C66C8C5F", _lerp);
		Debug.Log("お風呂入りたい");
		mainMat.SetColor("BE0AC573", new Color(_lerp, _lerp, _lerp, 1.0f));
	}
}
