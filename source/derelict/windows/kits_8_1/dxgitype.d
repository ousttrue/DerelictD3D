module derelict.windows.kits_8_1.dxgitype;

version (Windows):
extern (Windows):
nothrow:

import core.sys.windows.windows;
import derelict.windows.kits_8_1.dxgiformat;

/*
#define _FACDXGI    0x87a
#define MAKE_DXGI_HRESULT(code) MAKE_HRESULT(1, _FACDXGI, code)
#define MAKE_DXGI_STATUS(code)  MAKE_HRESULT(0, _FACDXGI, code)

// DXGI error messages have moved to winerror.h

#define DXGI_CPU_ACCESS_NONE                    ( 0 )
#define DXGI_CPU_ACCESS_DYNAMIC                 ( 1 )
#define DXGI_CPU_ACCESS_READ_WRITE              ( 2 )
#define DXGI_CPU_ACCESS_SCRATCH                 ( 3 )
#define DXGI_CPU_ACCESS_FIELD                   15

#define DXGI_USAGE_SHADER_INPUT                 ( 1L << (0 + 4) )
#define DXGI_USAGE_RENDER_TARGET_OUTPUT         ( 1L << (1 + 4) )
#define DXGI_USAGE_BACK_BUFFER                  ( 1L << (2 + 4) )
#define DXGI_USAGE_SHARED                       ( 1L << (3 + 4) )
#define DXGI_USAGE_READ_ONLY                    ( 1L << (4 + 4) )
#define DXGI_USAGE_DISCARD_ON_PRESENT           ( 1L << (5 + 4) )
#define DXGI_USAGE_UNORDERED_ACCESS             ( 1L << (6 + 4) )
*/

struct DXGI_RGB
{
    float Red;
    float Green;
    float Blue;
}

struct D3DCOLORVALUE 
{
    float r;
    float g;
    float b;
    float a;
}
alias D3DCOLORVALUE DXGI_RGBA;

struct DXGI_GAMMA_CONTROL
{
    DXGI_RGB Scale;
    DXGI_RGB Offset;
    DXGI_RGB[ 1025 ] GammaCurve;
}

struct DXGI_GAMMA_CONTROL_CAPABILITIES
{
    BOOL ScaleAndOffsetSupported;
    float MaxConvertedValue;
    float MinConvertedValue;
    UINT NumGammaControlPoints;
    float[1025] ControlPointPositions;
}

struct DXGI_RATIONAL
{
    UINT Numerator;
    UINT Denominator;
};

enum DXGI_MODE_SCANLINE_ORDER
{
    ORDER_UNSPECIFIED        = 0,
    ORDER_PROGRESSIVE        = 1,
    ORDER_UPPER_FIELD_FIRST  = 2,
    ORDER_LOWER_FIELD_FIRST  = 3
}

enum DXGI_MODE_SCALING
{
    UNSPECIFIED   = 0,
    CENTERED      = 1,
    STRETCHED     = 2
}

enum DXGI_MODE_ROTATION
{
    UNSPECIFIED  = 0,
    IDENTITY     = 1,
    ROTATE90     = 2,
    ROTATE180    = 3,
    ROTATE270    = 4
}

struct DXGI_MODE_DESC
{
    UINT Width;
    UINT Height;
    DXGI_RATIONAL RefreshRate;
    DXGI_FORMAT Format;
    DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
    DXGI_MODE_SCALING Scaling;
}

struct DXGI_SAMPLE_DESC
{
    UINT Count;
    UINT Quality;
}

