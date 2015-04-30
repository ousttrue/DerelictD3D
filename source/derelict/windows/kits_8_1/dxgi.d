module derelict.windows.kits_8_1.dxgi;
public import derelict.windows.kits_8_1.dxgiformat;
public import derelict.windows.kits_8_1.dxgitype;
public import std.uuid;
import core.sys.windows.windows;
import core.sys.windows.com;

version (Windows):
extern (Windows):
nothrow:


// guiddef.h
alias const GUID *REFGUID;
alias const IID *REFIID;


/*
#define DXGI_CPU_ACCESS_NONE    ( 0 )
#define DXGI_CPU_ACCESS_DYNAMIC    ( 1 )
#define DXGI_CPU_ACCESS_READ_WRITE    ( 2 )
#define DXGI_CPU_ACCESS_SCRATCH    ( 3 )
#define DXGI_CPU_ACCESS_FIELD        15
*/

enum DXGI_USAGE : uint
{
    SHADER_INPUT             =( 1L << (0 + 4) ),
    RENDER_TARGET_OUTPUT     =( 1L << (1 + 4) ),
    BACK_BUFFER              =( 1L << (2 + 4) ),
    SHARED                   =( 1L << (3 + 4) ),
    READ_ONLY                =( 1L << (4 + 4) ),
    DISCARD_ON_PRESENT       =( 1L << (5 + 4) ),
    UNORDERED_ACCESS         =( 1L << (6 + 4) )
}


enum DXGI_SWAP_EFFECT
{
    EFFECT_DISCARD	= 0,
    EFFECT_SEQUENTIAL	= 1,
    EFFECT_FLIP_SEQUENTIAL	= 3
}


struct DXGI_SWAP_CHAIN_DESC
{
    DXGI_MODE_DESC BufferDesc;
    DXGI_SAMPLE_DESC SampleDesc;
    DXGI_USAGE BufferUsage;
    UINT BufferCount;
    HWND OutputWindow;
    BOOL Windowed;
    DXGI_SWAP_EFFECT SwapEffect;
    UINT Flags;
}


// winnt.h
struct LUID 
{
    DWORD LowPart;
    LONG HighPart;
}


struct DXGI_ADAPTER_DESC
{
    WCHAR[ 128 ] Description;
    UINT VendorId;
    UINT DeviceId;
    UINT SubSysId;
    UINT Revision;
    SIZE_T DedicatedVideoMemory;
    SIZE_T DedicatedSystemMemory;
    SIZE_T SharedSystemMemory;
    LUID AdapterLuid;
}

extern(Windows)
{

interface IDXGIObject: IUnknown
{
    static immutable uuidof =
        UUID("aec22fb8-76f3-4639-9be0-28eb43a67a2e");

    HRESULT SetPrivateData( 
            in  REFGUID Name,
            in UINT DataSize,
            in void *pData);

    HRESULT SetPrivateDataInterface( 
            in REFGUID Name,
            in IUnknown pUnknown);

    HRESULT GetPrivateData( 
            in  REFGUID Name,
            inout  UINT *pDataSize,
             void *pData);

    HRESULT GetParent( 
            in REFIID riid,
             void *ppParent);
}


interface IDXGIOutput
{
}


interface IDXGIAdapter: IDXGIObject
{
    static immutable uuidof =
        UUID("2411e7e1-12ac-4ccf-bd14-9798e8534dc0");

    HRESULT EnumOutputs( 
            in UINT Output,
              IDXGIOutput *ppOutput);

    HRESULT GetDesc( 
             DXGI_ADAPTER_DESC *pDesc);

    HRESULT CheckInterfaceSupport( 
            in  REFGUID InterfaceName,
              LARGE_INTEGER *pUMDVersion);
}


interface IDXGIDeviceSubObject: IDXGIObject
{
    static immutable uuidof=
        UUID("3d3e0379-f9de-4d58-bb6c-18d62992f1a6");

    HRESULT GetDevice( 
            in REFIID riid,
             void *ppDevice);
}


interface IDXGISwapChain: IDXGIDeviceSubObject
{
    static immutable uuidof
        =UUID("310d36a0-d2e7-4c0a-aa04-6a9d23b8886a");

    HRESULT Present( 
            in UINT SyncInterval,
            in UINT Flags);

    HRESULT GetBuffer( 
            in UINT Buffer,
            in REFIID riid,
            void **ppSurface);

    HRESULT SetFullscreenState( 
            in BOOL Fullscreen,
            in IDXGIOutput pTarget);

    HRESULT GetFullscreenState( 
             BOOL *pFullscreen,
             IDXGIOutput *ppTarget);

    HRESULT GetDesc( 
             DXGI_SWAP_CHAIN_DESC *pDesc);

    HRESULT ResizeBuffers( 
            in UINT BufferCount,
            in UINT Width,
            in UINT Height,
            in DXGI_FORMAT NewFormat,
            in UINT SwapChainFlags);

    HRESULT ResizeTarget( 
            in DXGI_MODE_DESC *pNewTargetParameters);

    HRESULT GetContainingOutput( 
             IDXGIOutput *ppOutput);

	/*
    HRESULT GetFrameStatistics( 
             DXGI_FRAME_STATISTICS *pStats);

    HRESULT GetLastPresentCount( 
             UINT *pLastPresentCount);
	*/
}

}

