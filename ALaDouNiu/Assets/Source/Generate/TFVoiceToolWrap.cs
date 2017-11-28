﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class TFVoiceToolWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(TFVoiceTool), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("StartRecord", StartRecord);
		L.RegFunction("StopRecord", StopRecord);
		L.RegFunction("CancelRecord", CancelRecord);
		L.RegFunction("AddPlay", AddPlay);
		L.RegFunction("PassPlay", PassPlay);
		L.RegFunction("StopPlay", StopPlay);
		L.RegFunction("SetMsgCallBack", SetMsgCallBack);
		L.RegFunction("PlayFuncMsg", PlayFuncMsg);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Instance", get_Instance, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StartRecord(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.StartRecord(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StopRecord(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			obj.StopRecord();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CancelRecord(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			obj.CancelRecord();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddPlay(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.AddPlay(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PassPlay(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			obj.PassPlay();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StopPlay(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			obj.StopPlay();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetMsgCallBack(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.SetMsgCallBack(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PlayFuncMsg(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			TFVoiceTool obj = (TFVoiceTool)ToLua.CheckObject(L, 1, typeof(TFVoiceTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.PlayFuncMsg(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Instance(IntPtr L)
	{
		try
		{
			ToLua.Push(L, TFVoiceTool.Instance);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

