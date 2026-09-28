extern fn void	messageBox(int, char*, char*, int) @cname("MessageBoxA");
extern fn int	exitProcess(int) @cname("ExitProcess");
extern fn void*	createWindow
(
	uint		dwExStyle,
	char*		lpClassName,
	char*		lpWindowName,
	uint		dwStyle,
	int			x,
	int			y,
	int			nWidth,
	int			nHeight,
	void*		hWndParent,
	void*		hMenu,
	void*		hInstance,
	void*		lpParam
)
@cname("CreateWindowExA");

extern fn int peekMessage
(
	void*,
	void*,
	uint,
	uint,
	uint
)
@cname("PeekMessageA");

extern fn void translateMessage
(
	void*
)
@cname("TranslateMessage");

extern fn void dispatchMessage
(
	void*
)
@cname("DispatchMessageA");

extern fn int isWindow
(
	void*
)
@cname("IsWindow");

char[64] msg @cname("msg");
fn void main() @export("main")
{
	messageBox(0, "hallo", "world!", 0);

	void* hwnd = createWindow(
		0,
		"edit",
		null,
		0x10CF0000,
		0,
		0,
		200,
		200,
		null,
		null,
		null,
		null
	);

	while(isWindow(hwnd)) {
		while(peekMessage(null, null, 0, 0, 1)) {
			translateMessage(&msg);
			dispatchMessage(&msg);
		}
	}
	exitProcess(0);
}
