﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ResHelperWrap
{
	public static void Register(LuaState L)
	{
		L.BeginStaticLibs("ResHelper");
		L.RegFunction("LoadResBySyn", LoadResBySyn);
		L.RegFunction("LoadResByAsync", LoadResByAsync);
		L.RegFunction("Retain", Retain);
		L.RegFunction("UnLoadUnUse", UnLoadUnUse);
		L.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoadResBySyn(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1 && TypeChecker.CheckTypes(L, 1, typeof(string)))
			{
				string arg0 = ToLua.ToString(L, 1);
				UnityEngine.Object o = ResHelper.LoadResBySyn(arg0);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 2 && TypeChecker.CheckTypes(L, 1, typeof(string), typeof(UnityEngine.Object)))
			{
				string arg0 = ToLua.ToString(L, 1);
				UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
				UnityEngine.Object o = ResHelper.LoadResBySyn(arg0, arg1);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ResHelper.LoadResBySyn");
			}
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoadResByAsync(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes(L, 1, typeof(string), typeof(LuaInterface.LuaFunction)))
			{
				string arg0 = ToLua.ToString(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				ResHelper.LoadResByAsync(arg0, arg1);
				return 0;
			}
			else if (count == 3 && TypeChecker.CheckTypes(L, 1, typeof(string), typeof(LuaInterface.LuaFunction), typeof(UnityEngine.Object)))
			{
				string arg0 = ToLua.ToString(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				UnityEngine.Object arg2 = (UnityEngine.Object)ToLua.ToObject(L, 3);
				ResHelper.LoadResByAsync(arg0, arg1, arg2);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ResHelper.LoadResByAsync");
			}
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Retain(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			string arg0 = ToLua.CheckString(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.Object));
			ResHelper.Retain(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UnLoadUnUse(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			ResHelper.UnLoadUnUse();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

