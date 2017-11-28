﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LocationToolWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LocationTool), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("ReqLoc", ReqLoc);
		L.RegFunction("ReqLocRtn", ReqLocRtn);
		L.RegFunction("Battery_Unity", Battery_Unity);
		L.RegFunction("BatteryRtn", BatteryRtn);
		L.RegFunction("TaiJiDun_Unity", TaiJiDun_Unity);
		L.RegFunction("TaiJiDunRtn", TaiJiDunRtn);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Instance", get_Instance, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReqLoc(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.ReqLoc(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReqLocRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.ReqLocRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Battery_Unity(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.Battery_Unity(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int BatteryRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.BatteryRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TaiJiDun_Unity(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			string arg0 = ToLua.CheckString(L, 2);
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.TaiJiDun_Unity(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TaiJiDunRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LocationTool obj = (LocationTool)ToLua.CheckObject(L, 1, typeof(LocationTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.TaiJiDunRtn(arg0);
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
			ToLua.Push(L, LocationTool.Instance);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
