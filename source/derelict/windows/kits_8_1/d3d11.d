module derelict.windows.kits_8_1.d3d11;
import core.sys.windows.windef;
import core.sys.windows.com;
public import derelict.windows.kits_8_1.d3dcommon;
public import derelict.windows.kits_8_1.dxgi;

version (Windows):


enum : uint
{
    D3D11_SDK_VERSION=( 7 )
}


enum D3D11_INPUT
{
    PER_VERTEX_DATA	= 0,
    PER_INSTANCE_DATA	= 1
}

enum
{
    D3D11_APPEND_ALIGNED_ELEMENT=0xffffffff,
}

enum D3D11_USAGE
{
	DEFAULT	= 0,
	IMMUTABLE	= 1,
	DYNAMIC	= 2,
	STAGING	= 3
}

enum D3D11_BIND
{
    VERTEX_BUFFER	= 0x1L,
    INDEX_BUFFER	= 0x2L,
    CONSTANT_BUFFER	= 0x4L,
    SHADER_RESOURCE	= 0x8L,
    STREAM_OUTPUT	= 0x10L,
    RENDER_TARGET	= 0x20L,
    DEPTH_STENCIL	= 0x40L,
    UNORDERED_ACCESS	= 0x80L,
    DECODER	= 0x200L,
    VIDEO_ENCODER	= 0x400L
}

enum D3D11_MAP
{
    READ	= 1,
    WRITE	= 2,
    READ_WRITE	= 3,
    WRITE_DISCARD	= 4,
    WRITE_NO_OVERWRITE	= 5
}


struct D3D11_INPUT_ELEMENT_DESC
{
    LPCSTR SemanticName;
    UINT SemanticIndex;
    DXGI_FORMAT Format;
    UINT InputSlot;
    UINT AlignedByteOffset;
    D3D11_INPUT InputSlotClass;
    UINT InstanceDataStepRate;
}


struct D3D11_VIEWPORT
{
    FLOAT TopLeftX;
    FLOAT TopLeftY;
    FLOAT Width;
    FLOAT Height;
    FLOAT MinDepth;
    FLOAT MaxDepth;
}


alias RECT D3D11_RECT;


struct D3D11_BOX
{
    UINT left;
    UINT top;
    UINT front;
    UINT right;
    UINT bottom;
    UINT back;
}


enum D3D11_BLEND
{
    ZERO	= 1,
    ONE	= 2,
    SRC_COLOR	= 3,
    INV_SRC_COLOR	= 4,
    SRC_ALPHA	= 5,
    INV_SRC_ALPHA	= 6,
    DEST_ALPHA	= 7,
    INV_DEST_ALPHA	= 8,
    DEST_COLOR	= 9,
    INV_DEST_COLOR	= 10,
    SRC_ALPHA_SAT	= 11,
    BLEND_FACTOR	= 14,
    INV_BLEND_FACTOR	= 15,
    SRC1_COLOR	= 16,
    INV_SRC1_COLOR	= 17,
    SRC1_ALPHA	= 18,
    INV_SRC1_ALPHA	= 19
}

enum D3D11_BLEND_OP
{
    ADD	= 1,
    SUBTRACT	= 2,
    REV_SUBTRACT	= 3,
    MIN	= 4,
    MAX	= 5
}

enum D3D11_COLOR_WRITE_ENABLE
{
    RED	= 1,
    GREEN	= 2,
    BLUE	= 4,
    ALPHA	= 8,
    ALL	= ( ( ( RED | GREEN )  | BLUE )  | ALPHA ) 
}

struct D3D11_RENDER_TARGET_BLEND_DESC
{
    BOOL BlendEnable;
    D3D11_BLEND SrcBlend;
    D3D11_BLEND DestBlend;
    D3D11_BLEND_OP BlendOp;
    D3D11_BLEND SrcBlendAlpha;
    D3D11_BLEND DestBlendAlpha;
    D3D11_BLEND_OP BlendOpAlpha;
    BYTE RenderTargetWriteMask;
}

struct D3D11_BLEND_DESC
{
    BOOL AlphaToCoverageEnable;
    BOOL IndependentBlendEnable;
    D3D11_RENDER_TARGET_BLEND_DESC[8] RenderTarget;
}


enum D3D11_FILL_MODE
{
    WIREFRAME	= 2,
    SOLID	= 3
}

enum D3D11_CULL_MODE
{
    NONE	= 1,
    FRONT	= 2,
    BACK	= 3
}


struct D3D11_RASTERIZER_DESC
{
    D3D11_FILL_MODE FillMode;
    D3D11_CULL_MODE CullMode;
    BOOL FrontCounterClockwise;
    INT DepthBias;
    FLOAT DepthBiasClamp;
    FLOAT SlopeScaledDepthBias;
    BOOL DepthClipEnable;
    BOOL ScissorEnable;
    BOOL MultisampleEnable;
    BOOL AntialiasedLineEnable;
}


struct D3D11_BUFFER_DESC
{
    UINT ByteWidth;
    D3D11_USAGE Usage;
    UINT BindFlags;
    UINT CPUAccessFlags;
    UINT MiscFlags;
    UINT StructureByteStride;
}


struct D3D11_TEXTURE1D_DESC
{
    UINT Width;
    UINT MipLevels;
    UINT ArraySize;
    DXGI_FORMAT Format;
    D3D11_USAGE Usage;
    UINT BindFlags;
    UINT CPUAccessFlags;
    UINT MiscFlags;
}


struct D3D11_TEXTURE2D_DESC
{
    UINT Width;
    UINT Height;
    UINT MipLevels;
    UINT ArraySize;
    DXGI_FORMAT Format;
    DXGI_SAMPLE_DESC SampleDesc;
    D3D11_USAGE Usage;
    UINT BindFlags;
    UINT CPUAccessFlags;
    UINT MiscFlags;
}


struct D3D11_TEXTURE3D_DESC
{
    UINT Width;
    UINT Height;
    UINT Depth;
    UINT MipLevels;
    DXGI_FORMAT Format;
    D3D11_USAGE Usage;
    UINT BindFlags;
    UINT CPUAccessFlags;
    UINT MiscFlags;
}


struct D3D11_SUBRESOURCE_DATA
{
    void *pSysMem;
    UINT SysMemPitch;
    UINT SysMemSlicePitch;
}


struct D3D11_MAPPED_SUBRESOURCE
{
    void *pData;
    UINT RowPitch;
    UINT DepthPitch;
}


struct D3D11_DEPTH_STENCIL_VIEW_DESC
{
    DXGI_FORMAT Format;
    D3D11_DSV_DIMENSION ViewDimension;
    UINT Flags;
    union 
    {
        D3D11_TEX1D_DSV Texture1D;
        D3D11_TEX1D_ARRAY_DSV Texture1DArray;
        D3D11_TEX2D_DSV Texture2D;
        D3D11_TEX2D_ARRAY_DSV Texture2DArray;
        D3D11_TEX2DMS_DSV Texture2DMS;
        D3D11_TEX2DMS_ARRAY_DSV Texture2DMSArray;
    }
}


struct D3D11_TEX1D_DSV
{
    UINT MipSlice;
}

struct D3D11_TEX1D_ARRAY_DSV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2D_DSV
{
    UINT MipSlice;
}

struct D3D11_TEX2D_ARRAY_DSV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2DMS_DSV
{
    UINT UnusedField_NothingToDefine;
}

struct D3D11_TEX2DMS_ARRAY_DSV
{
    UINT FirstArraySlice;
    UINT ArraySize;
}


struct D3D11_BUFFER_RTV
{
    union 
    {
        UINT FirstElement;
        UINT ElementOffset;
    }
    union 
    {
        UINT NumElements;
        UINT ElementWidth;
    }
}

struct D3D11_TEX1D_RTV
{
    UINT MipSlice;
}

struct D3D11_TEX1D_ARRAY_RTV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2D_RTV
{
    UINT MipSlice;
}

struct D3D11_TEX2DMS_RTV
{
    UINT UnusedField_NothingToDefine;
}

struct D3D11_TEX2D_ARRAY_RTV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2DMS_ARRAY_RTV
{
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX3D_RTV
{
    UINT MipSlice;
    UINT FirstWSlice;
    UINT WSize;
}

enum D3D11_RESOURCE_DIMENSION
{
    D3D11_RESOURCE_DIMENSION_UNKNOWN	= 0,
    D3D11_RESOURCE_DIMENSION_BUFFER	= 1,
    D3D11_RESOURCE_DIMENSION_TEXTURE1D	= 2,
    D3D11_RESOURCE_DIMENSION_TEXTURE2D	= 3,
    D3D11_RESOURCE_DIMENSION_TEXTURE3D	= 4
}

alias D3D_SRV_DIMENSION D3D11_SRV_DIMENSION;

enum D3D11_DSV_DIMENSION
{
    D3D11_DSV_DIMENSION_UNKNOWN	= 0,
    D3D11_DSV_DIMENSION_TEXTURE1D	= 1,
    D3D11_DSV_DIMENSION_TEXTURE1DARRAY	= 2,
    D3D11_DSV_DIMENSION_TEXTURE2D	= 3,
    D3D11_DSV_DIMENSION_TEXTURE2DARRAY	= 4,
    D3D11_DSV_DIMENSION_TEXTURE2DMS	= 5,
    D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY	= 6
}

enum D3D11_RTV_DIMENSION
{
    D3D11_RTV_DIMENSION_UNKNOWN	= 0,
    D3D11_RTV_DIMENSION_BUFFER	= 1,
    D3D11_RTV_DIMENSION_TEXTURE1D	= 2,
    D3D11_RTV_DIMENSION_TEXTURE1DARRAY	= 3,
    D3D11_RTV_DIMENSION_TEXTURE2D	= 4,
    D3D11_RTV_DIMENSION_TEXTURE2DARRAY	= 5,
    D3D11_RTV_DIMENSION_TEXTURE2DMS	= 6,
    D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY	= 7,
    D3D11_RTV_DIMENSION_TEXTURE3D	= 8
}

enum D3D11_UAV_DIMENSION
{
    D3D11_UAV_DIMENSION_UNKNOWN	= 0,
    D3D11_UAV_DIMENSION_BUFFER	= 1,
    D3D11_UAV_DIMENSION_TEXTURE1D	= 2,
    D3D11_UAV_DIMENSION_TEXTURE1DARRAY	= 3,
    D3D11_UAV_DIMENSION_TEXTURE2D	= 4,
    D3D11_UAV_DIMENSION_TEXTURE2DARRAY	= 5,
    D3D11_UAV_DIMENSION_TEXTURE3D	= 8
}

struct D3D11_RENDER_TARGET_VIEW_DESC
{
    DXGI_FORMAT Format;
    D3D11_RTV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_RTV Buffer;
        D3D11_TEX1D_RTV Texture1D;
        D3D11_TEX1D_ARRAY_RTV Texture1DArray;
        D3D11_TEX2D_RTV Texture2D;
        D3D11_TEX2D_ARRAY_RTV Texture2DArray;
        D3D11_TEX2DMS_RTV Texture2DMS;
        D3D11_TEX2DMS_ARRAY_RTV Texture2DMSArray;
        D3D11_TEX3D_RTV Texture3D;
    }
}


struct D3D11_BUFFER_SRV
{
    union 
    {
        UINT FirstElement;
        UINT ElementOffset;
    }
    union 
    {
        UINT NumElements;
        UINT ElementWidth;
    }
}

enum D3D11_BUFFEREX_SRV_FLAG
{
    D3D11_BUFFEREX_SRV_FLAG_RAW	= 0x1
}

struct D3D11_BUFFEREX_SRV
{
    UINT FirstElement;
    UINT NumElements;
    UINT Flags;
}

struct D3D11_TEX1D_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
}

struct D3D11_TEX1D_ARRAY_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2D_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
}

struct D3D11_TEX2D_ARRAY_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX3D_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
}

struct D3D11_TEXCUBE_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
}

struct D3D11_TEXCUBE_ARRAY_SRV
{
    UINT MostDetailedMip;
    UINT MipLevels;
    UINT First2DArrayFace;
    UINT NumCubes;
}

struct D3D11_TEX2DMS_SRV
{
    UINT UnusedField_NothingToDefine;
}

struct D3D11_TEX2DMS_ARRAY_SRV
{
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_SHADER_RESOURCE_VIEW_DESC
{
    DXGI_FORMAT Format;
    D3D11_SRV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_SRV Buffer;
        D3D11_TEX1D_SRV Texture1D;
        D3D11_TEX1D_ARRAY_SRV Texture1DArray;
        D3D11_TEX2D_SRV Texture2D;
        D3D11_TEX2D_ARRAY_SRV Texture2DArray;
        D3D11_TEX2DMS_SRV Texture2DMS;
        D3D11_TEX2DMS_ARRAY_SRV Texture2DMSArray;
        D3D11_TEX3D_SRV Texture3D;
        D3D11_TEXCUBE_SRV TextureCube;
        D3D11_TEXCUBE_ARRAY_SRV TextureCubeArray;
        D3D11_BUFFEREX_SRV BufferEx;
    }
}


enum D3D11_BUFFER_UAV_FLAG
{
    RAW	= 0x1,
    APPEND	= 0x2,
    COUNTER	= 0x4
}

struct D3D11_BUFFER_UAV
{
    UINT FirstElement;
    UINT NumElements;
    UINT Flags;
}

struct D3D11_TEX1D_UAV
{
    UINT MipSlice;
}

struct D3D11_TEX1D_ARRAY_UAV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX2D_UAV
{
    UINT MipSlice;
}

struct D3D11_TEX2D_ARRAY_UAV
{
    UINT MipSlice;
    UINT FirstArraySlice;
    UINT ArraySize;
}

struct D3D11_TEX3D_UAV
{
    UINT MipSlice;
    UINT FirstWSlice;
    UINT WSize;
}

struct D3D11_UNORDERED_ACCESS_VIEW_DESC
{
    DXGI_FORMAT Format;
    D3D11_UAV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_UAV Buffer;
        D3D11_TEX1D_UAV Texture1D;
        D3D11_TEX1D_ARRAY_UAV Texture1DArray;
        D3D11_TEX2D_UAV Texture2D;
        D3D11_TEX2D_ARRAY_UAV Texture2DArray;
        D3D11_TEX3D_UAV Texture3D;
    }
}

struct D3D11_CLASS_INSTANCE_DESC
{
    UINT InstanceId;
    UINT InstanceIndex;
    UINT TypeId;
    UINT ConstantBuffer;
    UINT BaseConstantBufferOffset;
    UINT BaseTexture;
    UINT BaseSampler;
    BOOL Created;
}


enum D3D11_COMPARISON_FUNC
{
    NEVER	= 1,
    LESS	= 2,
    EQUAL	= 3,
    LESS_EQUAL	= 4,
    GREATER	= 5,
    NOT_EQUAL	= 6,
    GREATER_EQUAL	= 7,
    ALWAYS	= 8
}

enum D3D11_DEPTH_WRITE_MASK
{
    ZERO	= 0,
    ALL	= 1
}

enum D3D11_STENCIL_OP
{
    KEEP	= 1,
    ZERO	= 2,
    REPLACE	= 3,
    INCR_SAT	= 4,
    DECR_SAT	= 5,
    INVERT	= 6,
    INCR	= 7,
    DECR	= 8
}

struct D3D11_DEPTH_STENCILOP_DESC
{
    D3D11_STENCIL_OP StencilFailOp;
    D3D11_STENCIL_OP StencilDepthFailOp;
    D3D11_STENCIL_OP StencilPassOp;
    D3D11_COMPARISON_FUNC StencilFunc;
}

struct D3D11_DEPTH_STENCIL_DESC
{
    BOOL DepthEnable;
    D3D11_DEPTH_WRITE_MASK DepthWriteMask;
    D3D11_COMPARISON_FUNC DepthFunc;
    BOOL StencilEnable;
    BYTE StencilReadMask;
    BYTE StencilWriteMask;
    D3D11_DEPTH_STENCILOP_DESC FrontFace;
    D3D11_DEPTH_STENCILOP_DESC BackFace;
}


enum D3D11_FILTER
{
    MIN_MAG_MIP_POINT	= 0,
    MIN_MAG_POINT_MIP_LINEAR	= 0x1,
    MIN_POINT_MAG_LINEAR_MIP_POINT	= 0x4,
    MIN_POINT_MAG_MIP_LINEAR	= 0x5,
    MIN_LINEAR_MAG_MIP_POINT	= 0x10,
    MIN_LINEAR_MAG_POINT_MIP_LINEAR	= 0x11,
    MIN_MAG_LINEAR_MIP_POINT	= 0x14,
    MIN_MAG_MIP_LINEAR	= 0x15,
    ANISOTROPIC	= 0x55,
    COMPARISON_MIN_MAG_MIP_POINT	= 0x80,
    COMPARISON_MIN_MAG_POINT_MIP_LINEAR	= 0x81,
    COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT	= 0x84,
    COMPARISON_MIN_POINT_MAG_MIP_LINEAR	= 0x85,
    COMPARISON_MIN_LINEAR_MAG_MIP_POINT	= 0x90,
    COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR	= 0x91,
    COMPARISON_MIN_MAG_LINEAR_MIP_POINT	= 0x94,
    COMPARISON_MIN_MAG_MIP_LINEAR	= 0x95,
    COMPARISON_ANISOTROPIC	= 0xd5,
    MINIMUM_MIN_MAG_MIP_POINT	= 0x100,
    MINIMUM_MIN_MAG_POINT_MIP_LINEAR	= 0x101,
    MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT	= 0x104,
    MINIMUM_MIN_POINT_MAG_MIP_LINEAR	= 0x105,
    MINIMUM_MIN_LINEAR_MAG_MIP_POINT	= 0x110,
    MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR	= 0x111,
    MINIMUM_MIN_MAG_LINEAR_MIP_POINT	= 0x114,
    MINIMUM_MIN_MAG_MIP_LINEAR	= 0x115,
    MINIMUM_ANISOTROPIC	= 0x155,
    MAXIMUM_MIN_MAG_MIP_POINT	= 0x180,
    MAXIMUM_MIN_MAG_POINT_MIP_LINEAR	= 0x181,
    MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT	= 0x184,
    MAXIMUM_MIN_POINT_MAG_MIP_LINEAR	= 0x185,
    MAXIMUM_MIN_LINEAR_MAG_MIP_POINT	= 0x190,
    MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR	= 0x191,
    MAXIMUM_MIN_MAG_LINEAR_MIP_POINT	= 0x194,
    MAXIMUM_MIN_MAG_MIP_LINEAR	= 0x195,
    MAXIMUM_ANISOTROPIC	= 0x1d5
}

enum D3D11_FILTER_TYPE
{
    POINT	= 0,
    LINEAR	= 1
}

enum D3D11_FILTER_REDUCTION_TYPE
{
    STANDARD	= 0,
    COMPARISON	= 1,
    MINIMUM	= 2,
    MAXIMUM	= 3
}

enum
{
    D3D11_FILTER_REDUCTION_TYPE_MASK	=( 0x3 ),
    D3D11_FILTER_REDUCTION_TYPE_SHIFT	=( 7 ),
    D3D11_FILTER_TYPE_MASK	=( 0x3 ),
    D3D11_MIN_FILTER_SHIFT	=( 4 ),
    D3D11_MAG_FILTER_SHIFT	=( 2 ),
    D3D11_MIP_FILTER_SHIFT	=( 0 ),
}

enum D3D11_TEXTURE_ADDRESS_MODE
{
    WRAP	= 1,
    MIRROR	= 2,
    CLAMP	= 3,
    BORDER	= 4,
    MIRROR_ONCE	= 5
}

struct D3D11_SAMPLER_DESC
{
    D3D11_FILTER Filter;
    D3D11_TEXTURE_ADDRESS_MODE AddressU;
    D3D11_TEXTURE_ADDRESS_MODE AddressV;
    D3D11_TEXTURE_ADDRESS_MODE AddressW;
    FLOAT MipLODBias;
    UINT MaxAnisotropy;
    D3D11_COMPARISON_FUNC ComparisonFunc;
    FLOAT[4] BorderColor;
    FLOAT MinLOD;
    FLOAT MaxLOD;
}


struct D3D11_SO_DECLARATION_ENTRY
{
    UINT Stream;
    LPCSTR SemanticName;
    UINT SemanticIndex;
    BYTE StartComponent;
    BYTE ComponentCount;
    BYTE OutputSlot;
}


alias D3D_PRIMITIVE_TOPOLOGY D3D11_PRIMITIVE_TOPOLOGY;


enum D3D11_ASYNC_GETDATA_FLAG
{
    D3D11_ASYNC_GETDATA_DONOTFLUSH	= 0x1
}

enum D3D11_QUERY
{
    EVENT	= 0,
    OCCLUSION	= ( EVENT + 1 ) ,
    TIMESTAMP	= ( OCCLUSION + 1 ) ,
    TIMESTAMP_DISJOINT	= ( TIMESTAMP + 1 ) ,
    PIPELINE_STATISTICS	= ( TIMESTAMP_DISJOINT + 1 ) ,
    OCCLUSION_PREDICATE	= ( PIPELINE_STATISTICS + 1 ) ,
    SO_STATISTICS	= ( OCCLUSION_PREDICATE + 1 ) ,
    SO_OVERFLOW_PREDICATE	= ( SO_STATISTICS + 1 ) ,
    SO_STATISTICS_STREAM0	= ( SO_OVERFLOW_PREDICATE + 1 ) ,
    SO_OVERFLOW_PREDICATE_STREAM0	= ( SO_STATISTICS_STREAM0 + 1 ) ,
    SO_STATISTICS_STREAM1	= ( SO_OVERFLOW_PREDICATE_STREAM0 + 1 ) ,
    SO_OVERFLOW_PREDICATE_STREAM1	= ( SO_STATISTICS_STREAM1 + 1 ) ,
    SO_STATISTICS_STREAM2	= ( SO_OVERFLOW_PREDICATE_STREAM1 + 1 ) ,
    SO_OVERFLOW_PREDICATE_STREAM2	= ( SO_STATISTICS_STREAM2 + 1 ) ,
    SO_STATISTICS_STREAM3	= ( SO_OVERFLOW_PREDICATE_STREAM2 + 1 ) ,
    SO_OVERFLOW_PREDICATE_STREAM3	= ( SO_STATISTICS_STREAM3 + 1 ) 
}

enum D3D11_QUERY_MISC_FLAG
{
    D3D11_QUERY_MISC_PREDICATEHINT	= 0x1
}

struct D3D11_QUERY_DESC
{
    D3D11_QUERY Query;
    UINT MiscFlags;
}


//////////////////////////////////////////////////////////////////////////////
// interfaces
//////////////////////////////////////////////////////////////////////////////
extern (Windows)
{

interface ID3D11Device: IUnknown
{
	static immutable uuidof =
		UUID("db6f6ddb-ac77-4e88-8253-819df9bbf140");

    HRESULT CreateBuffer( 
            in D3D11_BUFFER_DESC *pDesc,
            in D3D11_SUBRESOURCE_DATA *pInitialData,
            ID3D11Buffer *ppBuffer);

    HRESULT CreateTexture1D( 
            in D3D11_TEXTURE1D_DESC *pDesc,
            in D3D11_SUBRESOURCE_DATA *pInitialData,
             ID3D11Texture1D *ppTexture1D);

    HRESULT CreateTexture2D( 
            in D3D11_TEXTURE2D_DESC *pDesc,
            in D3D11_SUBRESOURCE_DATA *pInitialData,
             ID3D11Texture2D *ppTexture2D);

    HRESULT CreateTexture3D( 
            in D3D11_TEXTURE3D_DESC *pDesc,
            in D3D11_SUBRESOURCE_DATA *pInitialData,
             ID3D11Texture3D *ppTexture3D);

    HRESULT CreateShaderResourceView( 
            in ID3D11Resource pResource,
            in D3D11_SHADER_RESOURCE_VIEW_DESC *pDesc,
             ID3D11ShaderResourceView *ppSRView);

    HRESULT CreateUnorderedAccessView( 
            in ID3D11Resource pResource,
            in D3D11_UNORDERED_ACCESS_VIEW_DESC *pDesc,
             ID3D11UnorderedAccessView *ppUAView);

    HRESULT CreateRenderTargetView( 
            in ID3D11Resource pResource,
            in D3D11_RENDER_TARGET_VIEW_DESC *pDesc,
            ID3D11RenderTargetView *ppRTView);

    HRESULT CreateDepthStencilView( 
            in ID3D11Resource pResource,
            in D3D11_DEPTH_STENCIL_VIEW_DESC *pDesc,
             ID3D11DepthStencilView *ppDepthStencilView);

    HRESULT CreateInputLayout( 
            in D3D11_INPUT_ELEMENT_DESC *pInputElementDescs,
            in UINT NumElements,
            in void *pShaderBytecodeWithInputSignature,
            in  SIZE_T BytecodeLength,
            ID3D11InputLayout *ppInputLayout);

    HRESULT CreateVertexShader( 
            in void *pShaderBytecode,
            in  SIZE_T BytecodeLength,
            in  ID3D11ClassLinkage pClassLinkage,
            ID3D11VertexShader *ppVertexShader);

    HRESULT CreateGeometryShader( 
            in void *pShaderBytecode,
            in SIZE_T BytecodeLength,
            in ID3D11ClassLinkage pClassLinkage,
            ID3D11GeometryShader *ppGeometryShader);

    HRESULT CreateGeometryShaderWithStreamOutput( 
            in void *pShaderBytecode,
            in SIZE_T BytecodeLength,
            in D3D11_SO_DECLARATION_ENTRY *pSODeclaration,
            in UINT NumEntries,
            in UINT *pBufferStrides,
            in UINT NumStrides,
            in UINT RasterizedStream,
            in ID3D11ClassLinkage pClassLinkage,
            ID3D11GeometryShader *ppGeometryShader);

    HRESULT CreatePixelShader( 
            in void *pShaderBytecode,
            in SIZE_T BytecodeLength,
            in ID3D11ClassLinkage pClassLinkage,
            ID3D11PixelShader *ppPixelShader);

    /*
	HRESULT CreateHullShader( 
	_In_reads_(BytecodeLength)  const void *pShaderBytecode,
	_In_  SIZE_T BytecodeLength,
	_In_opt_  ID3D11ClassLinkage *pClassLinkage,
	_Out_opt_  ID3D11HullShader **ppHullShader);

	HRESULT CreateDomainShader( 
	_In_reads_(BytecodeLength)  const void *pShaderBytecode,
	_In_  SIZE_T BytecodeLength,
	_In_opt_  ID3D11ClassLinkage *pClassLinkage,
	_Out_opt_  ID3D11DomainShader **ppDomainShader);

	HRESULT CreateComputeShader( 
	_In_reads_(BytecodeLength)  const void *pShaderBytecode,
	_In_  SIZE_T BytecodeLength,
	_In_opt_  ID3D11ClassLinkage *pClassLinkage,
	_Out_opt_  ID3D11ComputeShader **ppComputeShader);

	HRESULT CreateClassLinkage( 
	_Out_  ID3D11ClassLinkage **ppLinkage);

	HRESULT CreateBlendState( 
	in D3D11_BLEND_DESC *pBlendStateDesc,
	_Out_opt_  ID3D11BlendState **ppBlendState);

	HRESULT CreateDepthStencilState( 
	in D3D11_DEPTH_STENCIL_DESC *pDepthStencilDesc,
	_Out_opt_  ID3D11DepthStencilState **ppDepthStencilState);

	HRESULT CreateRasterizerState( 
	in D3D11_RASTERIZER_DESC *pRasterizerDesc,
	_Out_opt_  ID3D11RasterizerState **ppRasterizerState);

	HRESULT CreateSamplerState( 
	in D3D11_SAMPLER_DESC *pSamplerDesc,
	_Out_opt_  ID3D11SamplerState **ppSamplerState);

	HRESULT CreateQuery( 
	in D3D11_QUERY_DESC *pQueryDesc,
	_Out_opt_  ID3D11Query **ppQuery);

	HRESULT CreatePredicate( 
	in D3D11_QUERY_DESC *pPredicateDesc,
	_Out_opt_  ID3D11Predicate **ppPredicate);

	HRESULT CreateCounter( 
	in D3D11_COUNTER_DESC *pCounterDesc,
	_Out_opt_  ID3D11Counter **ppCounter);

	HRESULT CreateDeferredContext( 
	UINT ContextFlags,
	_Out_opt_  ID3D11DeviceContext **ppDeferredContext);

	HRESULT OpenSharedResource( 
	_In_  HANDLE hResource,
	_In_  REFIID ReturnedInterface,
	_Out_opt_  void **ppResource);

	HRESULT CheckFormatSupport( 
	_In_  DXGI_FORMAT Format,
	_Out_  UINT *pFormatSupport);

	HRESULT CheckMultisampleQualityLevels( 
	_In_  DXGI_FORMAT Format,
	_In_  UINT SampleCount,
	_Out_  UINT *pNumQualityLevels);

	void CheckCounterInfo( 
	_Out_  D3D11_COUNTER_INFO *pCounterInfo);

	HRESULT CheckCounter( 
	in D3D11_COUNTER_DESC *pDesc,
	_Out_  D3D11_COUNTER_TYPE *pType,
	_Out_  UINT *pActiveCounters,
	_Out_writes_opt_(*pNameLength)  LPSTR szName,
	_Inout_opt_  UINT *pNameLength,
	_Out_writes_opt_(*pUnitsLength)  LPSTR szUnits,
	_Inout_opt_  UINT *pUnitsLength,
	_Out_writes_opt_(*pDescriptionLength)  LPSTR szDescription,
	_Inout_opt_  UINT *pDescriptionLength);

	HRESULT CheckFeatureSupport( 
	D3D11_FEATURE Feature,
	_Out_writes_bytes_(FeatureSupportDataSize)  void *pFeatureSupportData,
	UINT FeatureSupportDataSize);

	HRESULT GetPrivateData( 
	_In_  REFGUID guid,
	_Inout_  UINT *pDataSize,
	_Out_writes_bytes_opt_(*pDataSize)  void *pData);

	HRESULT SetPrivateData( 
	_In_  REFGUID guid,
	_In_  UINT DataSize,
	_In_reads_bytes_opt_(DataSize)  const void *pData);

	HRESULT SetPrivateDataInterface( 
	_In_  REFGUID guid,
	_In_opt_  const IUnknown *pData);

	D3D_FEATURE_LEVEL GetFeatureLevel( void);

	UINT GetCreationFlags( void);

	HRESULT GetDeviceRemovedReason( void);

	void GetImmediateContext( 
	_Out_  ID3D11DeviceContext **ppImmediateContext);

	HRESULT SetExceptionMode( 
	UINT RaiseFlags);

	UINT GetExceptionMode( void);
	*/
}


interface ID3D11DeviceChild :IUnknown
{
	static immutable uuidof
		=UUID("1841e5c8-16b0-489b-bcc8-44cfb0d5deae");

	void GetDevice(
					 ID3D11Device *ppDevice);

	HRESULT GetPrivateData( 
							in REFGUID guid,
							inout UINT *pDataSize,
							 void *pData);

	HRESULT SetPrivateData( 
							in REFGUID guid,
							in UINT DataSize,
							in void *pData);

	HRESULT SetPrivateDataInterface( 
									in REFGUID guid,
									in IUnknown *pData);
}


interface ID3D11DeviceContext: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("c0bfa96c-e089-44fb-8eaf-26f8796190da");

    void VSSetConstantBuffers( 
            in UINT StartSlot,
            in UINT NumBuffers,
            in ID3D11Buffer *ppConstantBuffers);

    void PSSetShaderResources( 
            in UINT StartSlot,
            in UINT NumViews,
            in ID3D11ShaderResourceView  *ppShaderResourceViews);

    void PSSetShader( 
            in ID3D11PixelShader pPixelShader,
            in ID3D11ClassInstance *ppClassInstances,
            UINT NumClassInstances);

    void PSSetSamplers( 
            in UINT StartSlot,
            in UINT NumSamplers,
            in ID3D11SamplerState *ppSamplers);

    void VSSetShader( 
            in ID3D11VertexShader pVertexShader,
            in ID3D11ClassInstance *ppClassInstances,
            UINT NumClassInstances);

    void DrawIndexed( 
            in UINT IndexCount,
            in UINT StartIndexLocation,
            in INT BaseVertexLocation);

    void Draw( 
            in UINT VertexCount,
            in UINT StartVertexLocation);

    HRESULT Map( 
            in ID3D11Resource *pResource,
            in UINT Subresource,
            in D3D11_MAP MapType,
            in UINT MapFlags,
             D3D11_MAPPED_SUBRESOURCE *pMappedResource);

    void Unmap( 
            in ID3D11Resource *pResource,
            in UINT Subresource);

    void PSSetConstantBuffers( 
            in UINT StartSlot,
            in UINT NumBuffers,
            in ID3D11Buffer *ppConstantBuffers);

    void IASetInputLayout( 
            in ID3D11InputLayout pInputLayout);

    void IASetVertexBuffers( 
            in UINT StartSlot,
            in UINT NumBuffers,
            in ID3D11Buffer *ppVertexBuffers,
            in UINT *pStrides,
            in UINT *pOffsets);

    void IASetIndexBuffer( 
            in ID3D11Buffer pIndexBuffer,
            in DXGI_FORMAT Format,
            in UINT Offset);

    void DrawIndexedInstanced( 
            in UINT IndexCountPerInstance,
            in UINT InstanceCount,
            in UINT StartIndexLocation,
            in INT BaseVertexLocation,
            in UINT StartInstanceLocation);

    void DrawInstanced( 
            in UINT VertexCountPerInstance,
            in UINT InstanceCount,
            in UINT StartVertexLocation,
            in UINT StartInstanceLocation);

    void GSSetConstantBuffers( 
            in UINT StartSlot,
            in UINT NumBuffers,
            in ID3D11Buffer *ppConstantBuffers);

    void GSSetShader( 
            in ID3D11GeometryShader pShader,
            in ID3D11ClassInstance *ppClassInstances,
            UINT NumClassInstances);

	void IASetPrimitiveTopology( 
            in D3D11_PRIMITIVE_TOPOLOGY Topology);

    void VSSetShaderResources( 
            in UINT StartSlot,
            in UINT NumViews,
            in ID3D11ShaderResourceView *ppShaderResourceViews);

    void VSSetSamplers( 
            in UINT StartSlot,
            in UINT NumSamplers,
            in ID3D11SamplerState *ppSamplers);

    void Begin( 
            in ID3D11Asynchronous pAsync);

    void End( 
            in ID3D11Asynchronous pAsync);

    HRESULT GetData( 
            in ID3D11Asynchronous pAsync,
             void *pData,
            in UINT DataSize,
            in UINT GetDataFlags);

    void SetPredication( 
            in ID3D11Predicate pPredicate,
            in BOOL PredicateValue);

    void GSSetShaderResources( 
            in UINT StartSlot,
            in UINT NumViews,
            in ID3D11ShaderResourceView *ppShaderResourceViews);

    void GSSetSamplers( 
            in  UINT StartSlot,
            in  UINT NumSamplers,
            in ID3D11SamplerState *ppSamplers);

    void OMSetRenderTargets( 
            in UINT NumViews,
            in ID3D11RenderTargetView *ppRenderTargetViews,
            in ID3D11DepthStencilView pDepthStencilView);

    void OMSetRenderTargetsAndUnorderedAccessViews( 
            in UINT NumRTVs,
            in ID3D11RenderTargetView *ppRenderTargetViews,
            in ID3D11DepthStencilView pDepthStencilView,
            in UINT UAVStartSlot,
            in UINT NumUAVs,
            in ID3D11UnorderedAccessView *ppUnorderedAccessViews,
            in UINT *pUAVInitialCounts);

    void OMSetBlendState( 
            in ID3D11BlendState pBlendState,
            in FLOAT *BlendFactor,
            in UINT SampleMask);

    void OMSetDepthStencilState( 
            in ID3D11DepthStencilState pDepthStencilState,
            in UINT StencilRef);

    void SOSetTargets( 
            in UINT NumBuffers,
            in ID3D11Buffer *ppSOTargets,
            in UINT *pOffsets);

    void DrawAuto();

    void DrawIndexedInstancedIndirect( 
            in ID3D11Buffer pBufferForArgs,
            in UINT AlignedByteOffsetForArgs);

    void DrawInstancedIndirect( 
            in ID3D11Buffer pBufferForArgs,
            in UINT AlignedByteOffsetForArgs);

    void Dispatch( 
            in UINT ThreadGroupCountX,
            in UINT ThreadGroupCountY,
            in UINT ThreadGroupCountZ);

    void DispatchIndirect( 
            in ID3D11Buffer pBufferForArgs,
            in UINT AlignedByteOffsetForArgs);

    void RSSetState( 
            in ID3D11RasterizerState pRasterizerState);

    void RSSetViewports( 
            in UINT NumViewports,
            in D3D11_VIEWPORT *pViewports);

    void RSSetScissorRects( 
            in UINT NumRects,
            in D3D11_RECT pRects);

    void CopySubresourceRegion( 
            in ID3D11Resource *pDstResource,
            in UINT DstSubresource,
            in UINT DstX,
            in UINT DstY,
            in UINT DstZ,
            in ID3D11Resource pSrcResource,
            in UINT SrcSubresource,
            in D3D11_BOX *pSrcBox);

    void CopyResource( 
            in ID3D11Resource pDstResource,
            in ID3D11Resource pSrcResource);

    void UpdateSubresource( 
            in ID3D11Resource pDstResource,
            in UINT DstSubresource,
            in D3D11_BOX *pDstBox,
            in void *pSrcData,
            in UINT SrcRowPitch,
            in UINT SrcDepthPitch);

    void CopyStructureCount( 
            in ID3D11Buffer pDstBuffer,
            in UINT DstAlignedByteOffset,
            in ID3D11UnorderedAccessView pSrcView);

    void ClearRenderTargetView( 
            in ID3D11RenderTargetView pRenderTargetView,
            in FLOAT* ColorRGBA);

	/*
	void ClearUnorderedAccessViewUint( 
	_In_  ID3D11UnorderedAccessView *pUnorderedAccessView,
	in UINT Values[ 4 ]);

	void ClearUnorderedAccessViewFloat( 
	_In_  ID3D11UnorderedAccessView *pUnorderedAccessView,
	in FLOAT Values[ 4 ]);

	void ClearDepthStencilView( 
	_In_  ID3D11DepthStencilView *pDepthStencilView,
	_In_  UINT ClearFlags,
	_In_  FLOAT Depth,
	_In_  UINT8 Stencil);

	void GenerateMips( 
	_In_  ID3D11ShaderResourceView *pShaderResourceView);

	void SetResourceMinLOD( 
	_In_  ID3D11Resource *pResource,
	FLOAT MinLOD);

	FLOAT GetResourceMinLOD( 
	_In_  ID3D11Resource *pResource);

	void ResolveSubresource( 
	_In_  ID3D11Resource *pDstResource,
	_In_  UINT DstSubresource,
	_In_  ID3D11Resource *pSrcResource,
	_In_  UINT SrcSubresource,
	_In_  DXGI_FORMAT Format);

	void ExecuteCommandList( 
	_In_  ID3D11CommandList *pCommandList,
	BOOL RestoreContextState);

	void HSSetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_In_reads_opt_(NumViews)  ID3D11ShaderResourceView *const *ppShaderResourceViews);

	void HSSetShader( 
	_In_opt_  ID3D11HullShader *pHullShader,
	_In_reads_opt_(NumClassInstances)  ID3D11ClassInstance *const *ppClassInstances,
	UINT NumClassInstances);

	void HSSetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_In_reads_opt_(NumSamplers)  ID3D11SamplerState *const *ppSamplers);

	void HSSetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_In_reads_opt_(NumBuffers)  ID3D11Buffer *const *ppConstantBuffers);

	void DSSetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_In_reads_opt_(NumViews)  ID3D11ShaderResourceView *const *ppShaderResourceViews);

	void DSSetShader( 
	_In_opt_  ID3D11DomainShader *pDomainShader,
	_In_reads_opt_(NumClassInstances)  ID3D11ClassInstance *const *ppClassInstances,
	UINT NumClassInstances);

	void DSSetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_In_reads_opt_(NumSamplers)  ID3D11SamplerState *const *ppSamplers);

	void DSSetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_In_reads_opt_(NumBuffers)  ID3D11Buffer *const *ppConstantBuffers);

	void CSSetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_In_reads_opt_(NumViews)  ID3D11ShaderResourceView *const *ppShaderResourceViews);

	void CSSetUnorderedAccessViews( 
	_In_range_( 0, D3D11_1_UAV_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_1_UAV_SLOT_COUNT - StartSlot )  UINT NumUAVs,
	_In_reads_opt_(NumUAVs)  ID3D11UnorderedAccessView *const *ppUnorderedAccessViews,
	_In_reads_opt_(NumUAVs)  const UINT *pUAVInitialCounts);

	void CSSetShader( 
	_In_opt_  ID3D11ComputeShader *pComputeShader,
	_In_reads_opt_(NumClassInstances)  ID3D11ClassInstance *const *ppClassInstances,
	UINT NumClassInstances);

	void CSSetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_In_reads_opt_(NumSamplers)  ID3D11SamplerState *const *ppSamplers);

	void CSSetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_In_reads_opt_(NumBuffers)  ID3D11Buffer *const *ppConstantBuffers);

	void VSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void PSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void PSGetShader( 
	_Out_  ID3D11PixelShader **ppPixelShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void PSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void VSGetShader( 
	_Out_  ID3D11VertexShader **ppVertexShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void PSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void IAGetInputLayout( 
	_Out_  ID3D11InputLayout **ppInputLayout);

	void IAGetVertexBuffers( 
	_In_range_( 0, D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppVertexBuffers,
	_Out_writes_opt_(NumBuffers)  UINT *pStrides,
	_Out_writes_opt_(NumBuffers)  UINT *pOffsets);

	void IAGetIndexBuffer( 
	_Out_opt_  ID3D11Buffer **pIndexBuffer,
	_Out_opt_  DXGI_FORMAT *Format,
	_Out_opt_  UINT *Offset);

	void GSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void GSGetShader( 
	_Out_  ID3D11GeometryShader **ppGeometryShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void IAGetPrimitiveTopology( 
	_Out_  D3D11_PRIMITIVE_TOPOLOGY *pTopology);

	void VSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void VSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void GetPredication( 
	_Out_opt_  ID3D11Predicate **ppPredicate,
	_Out_opt_  BOOL *pPredicateValue);

	void GSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void GSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void OMGetRenderTargets( 
	_In_range_( 0, D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11RenderTargetView **ppRenderTargetViews,
	_Out_opt_  ID3D11DepthStencilView **ppDepthStencilView);

	void OMGetRenderTargetsAndUnorderedAccessViews( 
	_In_range_( 0, D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT )  UINT NumRTVs,
	_Out_writes_opt_(NumRTVs)  ID3D11RenderTargetView **ppRenderTargetViews,
	_Out_opt_  ID3D11DepthStencilView **ppDepthStencilView,
	_In_range_( 0, D3D11_PS_CS_UAV_REGISTER_COUNT - 1 )  UINT UAVStartSlot,
	_In_range_( 0, D3D11_PS_CS_UAV_REGISTER_COUNT - UAVStartSlot )  UINT NumUAVs,
	_Out_writes_opt_(NumUAVs)  ID3D11UnorderedAccessView **ppUnorderedAccessViews);

	void OMGetBlendState( 
	_Out_opt_  ID3D11BlendState **ppBlendState,
	_Out_opt_  FLOAT BlendFactor[ 4 ],
	_Out_opt_  UINT *pSampleMask);

	void OMGetDepthStencilState( 
	_Out_opt_  ID3D11DepthStencilState **ppDepthStencilState,
	_Out_opt_  UINT *pStencilRef);

	void SOGetTargets( 
	_In_range_( 0, D3D11_SO_BUFFER_SLOT_COUNT )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppSOTargets);

	void RSGetState( 
	_Out_  ID3D11RasterizerState **ppRasterizerState);

	void RSGetViewports( 
	_Inout_ //_range(0, D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE )   UINT *pNumViewports,
	_Out_writes_opt_(*pNumViewports)  D3D11_VIEWPORT *pViewports);

	void RSGetScissorRects( 
	_Inout_ //_range(0, D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE )   UINT *pNumRects,
	_Out_writes_opt_(*pNumRects)  D3D11_RECT *pRects);

	void HSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void HSGetShader( 
	_Out_  ID3D11HullShader **ppHullShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void HSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void HSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void DSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void DSGetShader( 
	_Out_  ID3D11DomainShader **ppDomainShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void DSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void DSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void CSGetShaderResources( 
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot )  UINT NumViews,
	_Out_writes_opt_(NumViews)  ID3D11ShaderResourceView **ppShaderResourceViews);

	void CSGetUnorderedAccessViews( 
	_In_range_( 0, D3D11_PS_CS_UAV_REGISTER_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_PS_CS_UAV_REGISTER_COUNT - StartSlot )  UINT NumUAVs,
	_Out_writes_opt_(NumUAVs)  ID3D11UnorderedAccessView **ppUnorderedAccessViews);

	void CSGetShader( 
	_Out_  ID3D11ComputeShader **ppComputeShader,
	_Out_writes_opt_(*pNumClassInstances)  ID3D11ClassInstance **ppClassInstances,
	_Inout_opt_  UINT *pNumClassInstances);

	void CSGetSamplers( 
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot )  UINT NumSamplers,
	_Out_writes_opt_(NumSamplers)  ID3D11SamplerState **ppSamplers);

	void CSGetConstantBuffers( 
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1 )  UINT StartSlot,
	_In_range_( 0, D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot )  UINT NumBuffers,
	_Out_writes_opt_(NumBuffers)  ID3D11Buffer **ppConstantBuffers);

	void ClearState( void);

	void Flush( void);

	D3D11_DEVICE_CONTEXT_TYPE GetType( void);

	UINT GetContextFlags( void);

	HRESULT FinishCommandList( 
	BOOL RestoreDeferredContextState,
	_Out_opt_  ID3D11CommandList **ppCommandList);
	*/
}


interface ID3D11InputLayout: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("e4819ddc-4cf0-4025-bd26-5de82a3e07b7");
}


interface ID3D11VertexShader: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("3b301d64-d678-4289-8897-22f8928b72f3");
}

interface ID3D11GeometryShader: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("38325b96-effb-4022-ba02-2e795b70275c");
}

interface ID3D11PixelShader: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("ea82e40d-51dc-4f33-93d4-db7c9125ae8c");
}


interface ID3D11ClassInstance: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("a6cd7faa-b0b7-4a2f-9436-8662a65797cb");

    void GetClassLinkage( 
         ID3D11ClassLinkage *ppLinkage);
    
    void GetDesc( 
         D3D11_CLASS_INSTANCE_DESC *pDesc);
    
    void GetInstanceName( 
         LPSTR pInstanceName,
        inout SIZE_T *pBufferLength);
    
    void GetTypeName( 
         LPSTR pTypeName,
        inout SIZE_T *pBufferLength);
}


interface ID3D11SamplerState: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("da6fea51-564c-4487-9810-f0d0f9b4e3a5");

    void GetDesc( 
             D3D11_SAMPLER_DESC *pDesc);
}


interface ID3D11BlendState: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("75b68faa-347d-4159-8f45-a0640f01cd9a");

    void GetDesc( 
             D3D11_BLEND_DESC *pDesc);
}


interface ID3D11DepthStencilState: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("03823efb-8d8f-4e1c-9aa2-f64bb2cbfdf1");

    void GetDesc( 
             D3D11_DEPTH_STENCIL_DESC *pDesc);
}


interface ID3D11RasterizerState: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("9bb4ab81-ab1a-4d8f-b506-fc04200b6ee7");

    void GetDesc( 
             D3D11_RASTERIZER_DESC *pDesc);
}


interface ID3D11ClassLinkage: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("ddf57cba-9543-46e4-a12b-f207a0fe7fed");

    HRESULT GetClassInstance( 
            in LPCSTR pClassInstanceName,
            in UINT InstanceIndex,
             ID3D11ClassInstance *ppInstance);

    HRESULT CreateClassInstance( 
            in LPCSTR pClassTypeName,
            in UINT ConstantBufferOffset,
            in UINT ConstantVectorOffset,
            in UINT TextureOffset,
            in UINT SamplerOffset,
             ID3D11ClassInstance *ppInstance);
}


interface ID3D11Resource: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("dc8e63f3-d12b-4952-b47b-5e45026a862d");

    void GetType( 
             D3D11_RESOURCE_DIMENSION *pResourceDimension);

    void SetEvictionPriority( 
            in UINT EvictionPriority);

    UINT GetEvictionPriority();
}


interface ID3D11Buffer: ID3D11Resource
{
    static immutable uuidof= 
        UUID("48570b85-d1ee-4fcd-a250-eb350722b037");

    void GetDesc(
             D3D11_BUFFER_DESC *pDesc);
}


interface ID3D11Texture1D: ID3D11Resource
{
    static immutable uuidof=
        UUID("f8fb5c27-c6b3-4f75-a4c8-439af2ef564c");

    void GetDesc( 
             D3D11_TEXTURE1D_DESC *pDesc);
}


interface ID3D11Texture2D: ID3D11Resource
{
    static immutable uuidof=
        UUID("6f15aaf2-d208-4e89-9ab4-489535d34f9c");

    void GetDesc( 
             D3D11_TEXTURE2D_DESC *pDesc);
}


interface ID3D11Texture3D: ID3D11Resource
{
    static immutable uuidof=
        UUID("037e866e-f56d-4357-a8af-9dabbe6e250e");

    void GetDesc( 
             D3D11_TEXTURE3D_DESC *pDesc);
}


interface ID3D11View: ID3D11DeviceChild
{

    static immutable uuuidof=
        UUID("839d1216-bb2e-412b-b7f4-a9dbebe08ed1");

    void GetResource( 
             ID3D11Resource *ppResource);
}


interface ID3D11ShaderResourceView: ID3D11View
{
    static immutable uuidof=
        UUID("b0e06fe0-8192-4e1a-b1ca-36d7414710b2");

    void GetDesc( 
             D3D11_SHADER_RESOURCE_VIEW_DESC *pDesc);
}


interface ID3D11UnorderedAccessView: ID3D11View
{
    static immutable uuidof=
        UUID("28acf509-7f5c-48f6-8611-f316010a6380");

    void GetDesc( 
             D3D11_UNORDERED_ACCESS_VIEW_DESC *pDesc);
}


interface ID3D11RenderTargetView: ID3D11View
{
    static immutable uuidof=
        UUID("dfdba067-0b8d-4865-875b-d7b4516cc164");

    void GetDesc( 
             D3D11_RENDER_TARGET_VIEW_DESC *pDesc);
}


interface ID3D11DepthStencilView: ID3D11View
{
    static immutable uuidof=
        UUID("9fdac92a-1876-48c3-afad-25b94f84a9b6");

    void GetDesc( 
             D3D11_DEPTH_STENCIL_VIEW_DESC *pDesc);
}


interface ID3D11Asynchronous: ID3D11DeviceChild
{
    static immutable uuidof=
        UUID("4b35d0cd-1e15-4258-9c98-1b1333f6dd3b");

    UINT GetDataSize();
}


interface ID3D11Query: ID3D11Asynchronous
{
    static immutable uuidof=
        UUID("d6c00747-87b7-425e-b84d-44d108560afd");

    void GetDesc( 
             D3D11_QUERY_DESC *pDesc);
}


interface ID3D11Predicate: ID3D11Query
{
    static immutable uuidof= 
        UUID("9eb576dd-9f77-4d86-81aa-8bab5fe490e2");
}

}

//////////////////////////////////////////////////////////////////////////////
// Loader for d3d11.dll
//////////////////////////////////////////////////////////////////////////////
private {
    import derelict.util.loader;
    import derelict.util.system;

    static if( Derelict_OS_Windows )
        enum libNames = "d3d11.dll";
    else
        static assert( 0, "for Windows only." );
}


// signature
extern (Windows) nothrow @nogc
{
    alias da_D3D11CreateDeviceAndSwapChain =HRESULT function(
            in IDXGIAdapter pAdapter,
            D3D_DRIVER_TYPE DriverType,
            HMODULE Software,
            UINT Flags,
            in D3D_FEATURE_LEVEL* pFeatureLevels,
            UINT FeatureLevels,
            UINT SDKVersion,
            in DXGI_SWAP_CHAIN_DESC* pSwapChainDesc,
            /*  */ IDXGISwapChain* ppSwapChain,
            /*  */ ID3D11Device* ppDevice,
            /*  */ D3D_FEATURE_LEVEL* pFeatureLevel,
            /*  */ ID3D11DeviceContext* ppImmediateContext 
            );
}


// function pointer
__gshared {
    da_D3D11CreateDeviceAndSwapChain D3D11CreateDeviceAndSwapChain;
}


class DerelictD3D11Loader : SharedLibLoader {
    public this() {
        super( libNames );
    }

    protected override void loadSymbols() {

        bindFunc(cast(void**)&D3D11CreateDeviceAndSwapChain, "D3D11CreateDeviceAndSwapChain");

    }
}
__gshared DerelictD3D11Loader D3D11;
shared static this() {
    D3D11 = new DerelictD3D11Loader();
}

