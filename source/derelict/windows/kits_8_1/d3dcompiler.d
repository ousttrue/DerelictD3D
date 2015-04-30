module derelict.windows.kits_8_1.d3dcompiler;
import core.sys.windows.windows;
import derelict.windows.kits_8_1.d3dcommon;


immutable UINT_PTR D3D_COMPILE_STANDARD_FILE_INCLUDE = cast(UINT_PTR)1;

enum {
    D3DCOMPILE_DEBUG                          =(1 << 0),
    D3DCOMPILE_SKIP_VALIDATION                =(1 << 1),
    D3DCOMPILE_SKIP_OPTIMIZATION              =(1 << 2),
    D3DCOMPILE_PACK_MATRIX_ROW_MAJOR          =(1 << 3),
    D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR       =(1 << 4),
    D3DCOMPILE_PARTIAL_PRECISION              =(1 << 5),
    D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT       =(1 << 6),
    D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT       =(1 << 7),
    D3DCOMPILE_NO_PRESHADER                   =(1 << 8),
    D3DCOMPILE_AVOID_FLOW_CONTROL             =(1 << 9),
    D3DCOMPILE_PREFER_FLOW_CONTROL            =(1 << 10),
    D3DCOMPILE_ENABLE_STRICTNESS              =(1 << 11),
    D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY =(1 << 12),
    D3DCOMPILE_IEEE_STRICTNESS                =(1 << 13),
    D3DCOMPILE_OPTIMIZATION_LEVEL0            =(1 << 14),
    D3DCOMPILE_OPTIMIZATION_LEVEL1            =0,
    D3DCOMPILE_OPTIMIZATION_LEVEL2            =((1 << 14) | (1 << 15)),
    D3DCOMPILE_OPTIMIZATION_LEVEL3            =(1 << 15),
    D3DCOMPILE_RESERVED16                     =(1 << 16),
    D3DCOMPILE_RESERVED17                     =(1 << 17),
    D3DCOMPILE_WARNINGS_ARE_ERRORS            =(1 << 18),
    D3DCOMPILE_RESOURCES_MAY_ALIAS            =(1 << 19),
}


//////////////////////////////////////////////////////////////////////////////
// Loader for d3dcompiler_47.dll
//////////////////////////////////////////////////////////////////////////////
private {
    import derelict.util.loader;
    import derelict.util.system;

    static if( Derelict_OS_Windows )
	{
	}
    else{
        static assert( 0, "for Windows only." );
	}
}


// signature
extern (Windows) nothrow @nogc
{
    alias da_D3DCompile=HRESULT function(
            in LPCVOID pSrcData,
            in SIZE_T SrcDataSize,
            in LPCSTR pSourceName,
            in D3D_SHADER_MACRO* pDefines,
            in void* pInclude,
            in LPCSTR pEntrypoint,
            in LPCSTR pTarget,
            in UINT Flags1,
            in UINT Flags2,
            /*out*/ ID3DBlob* ppCode,
            /*out*/ ID3DBlob* ppErrorMsgs
            );
}


// function pointer
__gshared {
    da_D3DCompile D3DCompile;
}


class DerelictD3DCompilerLoader : SharedLibLoader {
    public this() {
        super( "d3dcompiler_47.dll" );
    }

    protected override void loadSymbols() {

        bindFunc(cast(void**)&D3DCompile, "D3DCompile");

    }
}
__gshared DerelictD3DCompilerLoader D3DCompiler;
shared static this() {
    D3DCompiler = new DerelictD3DCompilerLoader();
}

