﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class SpineCtrlWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(SpineCtrl), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("DoAni", DoAni);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DoAni(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 4);
			SpineCtrl obj = (SpineCtrl)ToLua.CheckObject(L, 1, typeof(SpineCtrl));
			string arg0 = ToLua.CheckString(L, 2);
			bool arg1 = LuaDLL.luaL_checkboolean(L, 3);
			bool arg2 = LuaDLL.luaL_checkboolean(L, 4);
			obj.DoAni(arg0, arg1, arg2);
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
}

