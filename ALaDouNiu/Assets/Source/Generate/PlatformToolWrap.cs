﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class PlatformToolWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(PlatformTool), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("GetVersion", GetVersion);
		L.RegFunction("GetPlatformID", GetPlatformID);
		L.RegFunction("DoAuth", DoAuth);
		L.RegFunction("AuthRtn", AuthRtn);
		L.RegFunction("MWShare", MWShare);
		L.RegFunction("ShareRtn", ShareRtn);
		L.RegFunction("GetMWRoom", GetMWRoom);
		L.RegFunction("ClearMWRoom", ClearMWRoom);
		L.RegFunction("MWRoomRtn", MWRoomRtn);
		L.RegFunction("PayRtn", PayRtn);
		L.RegFunction("PayAppStore", PayAppStore);
		L.RegFunction("ReqProducts", ReqProducts);
		L.RegFunction("Utf8GetBytes", Utf8GetBytes);
		L.RegFunction("Utf8BytesToString", Utf8BytesToString);
		L.RegFunction("GetStringHashCode", GetStringHashCode);
		L.RegFunction("GetCapture", GetCapture);
		L.RegFunction("CopyTextToClipBoard", CopyTextToClipBoard);
		L.RegFunction("CopyClipboardString", CopyClipboardString);
		L.RegFunction("CopyClipboardRtn", CopyClipboardRtn);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Instance", get_Instance, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetVersion(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string o = obj.GetVersion();
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetPlatformID(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			int o = obj.GetPlatformID();
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DoAuth(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			string arg1 = ToLua.CheckString(L, 3);
			string arg2 = ToLua.CheckString(L, 4);
			LuaFunction arg3 = ToLua.CheckLuaFunction(L, 5);
			obj.DoAuth(arg0, arg1, arg2, arg3);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AuthRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.AuthRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int MWShare(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			string arg1 = ToLua.CheckString(L, 3);
			string arg2 = ToLua.CheckString(L, 4);
			LuaFunction arg3 = ToLua.CheckLuaFunction(L, 5);
			obj.MWShare(arg0, arg1, arg2, arg3);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ShareRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.ShareRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetMWRoom(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.GetMWRoom(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearMWRoom(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			obj.ClearMWRoom();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int MWRoomRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.MWRoomRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PayRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.PayRtn(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PayAppStore(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 9);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			string arg1 = ToLua.CheckString(L, 3);
			string arg2 = ToLua.CheckString(L, 4);
			string arg3 = ToLua.CheckString(L, 5);
			string arg4 = ToLua.CheckString(L, 6);
			string arg5 = ToLua.CheckString(L, 7);
			string arg6 = ToLua.CheckString(L, 8);
			LuaFunction arg7 = ToLua.CheckLuaFunction(L, 9);
			obj.PayAppStore(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReqProducts(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			obj.ReqProducts();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Utf8GetBytes(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			byte[] o = obj.Utf8GetBytes(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Utf8BytesToString(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			byte[] arg0 = ToLua.CheckByteBuffer(L, 2);
			string o = obj.Utf8BytesToString(arg0);
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetStringHashCode(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			int o = obj.GetStringHashCode(arg0);
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetCapture(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			obj.GetCapture();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CopyTextToClipBoard(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.CopyTextToClipBoard(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CopyClipboardString(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.CopyClipboardString(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CopyClipboardRtn(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PlatformTool obj = (PlatformTool)ToLua.CheckObject(L, 1, typeof(PlatformTool));
			string arg0 = ToLua.CheckString(L, 2);
			obj.CopyClipboardRtn(arg0);
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
			ToLua.Push(L, PlatformTool.Instance);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
