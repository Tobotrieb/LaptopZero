#pragma once

#if !defined(ZLAPI)
#if defined(SYSTEM_WINDOWS)
#if defined(DLL_BUILD)
/*Marked as export DLL for MVSC*/
#define ZLAPI __declspec(dllexport)
#elif defined(DLL_USE)
/*Marked as import DLL for MVSC*/
#define ZLAPI __declspec(dllimport)
#else
/*Marked as static library import/export*/
#define ZLAPI
#endif
#elif defined(SYSTEM_LINUX)
#if defined(DLL_BUILD)
/*Marked as export DLL for GNU Compiler*/
#define ZLAPI __attribute__((visibility("default")))
#elif defined(DLL_USE)
/*Marked as import DLL for GNU Compiler*/
#define ZLAPI
#else
/*Marked as static library import/export*/
#define ZLAPI
#endif
#elif defined(SYSTEM_MACOSX)
#error MACOSX not implemented
#endif
#endif