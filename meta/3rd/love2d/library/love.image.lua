---@meta

---@class love.image
love.image = {}

---
---Determines whether a file can be loaded as CompressedImageData.
---
---@param filename string # The filename of the potentially compressed image file.
---@return boolean compressed # Whether the file can be loaded as CompressedImageData or not.
function love.image.isCompressed(filename) end

---
---Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.
---
---@param filename string # The filename of the compressed image file.
---@return love.CompressedImageData compressedImageData # The new CompressedImageData object.
function love.image.newCompressedData(filename) end

---
---Creates a new ImageData object.
---
---@param width number # The width of the ImageData.
---@param height number # The height of the ImageData.
---@return love.ImageData imageData # The new blank ImageData object. Each pixel's color values, (including the alpha values!) will be set to zero.
function love.image.newImageData(width, height) end

---@class love.CompressedImageData: love.Data, love.Object
local CompressedImageData = {}

---
---Gets the width and height of the CompressedImageData.
---
---@return number width # The width of the CompressedImageData.
---@return number height # The height of the CompressedImageData.
function CompressedImageData:getDimensions() end

---
---Gets the format of the CompressedImageData.
---
---@return love.CompressedImageFormat format # The format of the CompressedImageData.
function CompressedImageData:getFormat() end

---
---Gets the height of the CompressedImageData.
---
---@return number height # The height of the CompressedImageData.
function CompressedImageData:getHeight() end

---
---Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.
---
---@return number mipmaps # The number of mipmap levels stored in the CompressedImageData.
function CompressedImageData:getMipmapCount() end

---
---Gets the width of the CompressedImageData.
---
---@return number width # The width of the CompressedImageData.
function CompressedImageData:getWidth() end

---@class love.ImageData: love.Data, love.Object
local ImageData = {}

---
---Encodes the ImageData and optionally writes it to the save directory.
---
---@param format love.ImageFormat # The format to encode the image as.
---@param filename string # The filename to write the file to. If nil, no file will be written but the FileData will still be returned.
---@return love.FileData filedata # The encoded image as a new FileData object.
function ImageData:encode(format, filename) end

---
---Gets the width and height of the ImageData in pixels.
---
---@return number width # The width of the ImageData in pixels.
---@return number height # The height of the ImageData in pixels.
function ImageData:getDimensions() end

---
---Gets the height of the ImageData in pixels.
---
---@return number height # The height of the ImageData in pixels.
function ImageData:getHeight() end

---
---Gets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1. Non-integer values are floored.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
function ImageData:getPixel() end

---
---Gets the width of the ImageData in pixels.
---
---@return number width # The width of the ImageData in pixels.
function ImageData:getWidth() end

---
---Transform an image by applying a function to every pixel.
---
---This function is a higher-order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.
---
---The passed function is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function should return the new red, green, blue, and alpha values for that pixel.
---
---function pixelFunction(x, y, r, g, b, a)
---
---    -- template for defining your own pixel mapping function
---
---    -- perform computations giving the new values for r, g, b and a
---
---    -- ...
---
---    return r, g, b, a
---
---end
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
---@param pixelFunction function # Function to apply to every pixel.
---@param width number # The width of the area within the ImageData to apply the function to.
---@param height number # The height of the area within the ImageData to apply the function to.
function ImageData:mapPixel(pixelFunction, width, height) end

---
---Paste into ImageData from another source ImageData.
---
---@param source love.ImageData # Source ImageData from which to copy.
---@param dx number # Destination top-left position on x-axis.
---@param dy number # Destination top-left position on y-axis.
---@param sx number # Source top-left position on x-axis.
---@param sy number # Source top-left position on y-axis.
---@param sw number # Source width.
---@param sh number # Source height.
function ImageData:paste(source, dx, dy, sx, sy, sw, sh) end

---
---Sets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---
function ImageData:setPixel() end

---@class love.CompressedImageFormat
---@field DXT1 integer # The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images on desktop systems.
---@field DXT3 integer # The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.
---@field DXT5 integer # The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on desktop systems.
---@field BC4 integer # The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.
---@field BC4s integer # The signed variant of the BC4 format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---@field BC5 integer # The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.
---@field BC5s integer # The signed variant of the BC5 format.
---@field BC6h integer # The BC6H format. Stores half-precision floating-point RGB data in the range of 65504 at 8 bits per pixel. Suitable for HDR images on desktop systems.
---@field BC6hs integer # The signed variant of the BC6H format. Stores RGB data in the range of +65504.
---@field BC7 integer # The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.
---@field ETC1 integer # The ETC1 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on older Android devices.
---@field ETC2rgb integer # The RGB variant of the ETC2 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on newer mobile devices.
---@field ETC2rgba integer # The RGBA variant of the ETC2 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on newer mobile devices.
---@field ETC2rgba1 integer # The RGBA variant of the ETC2 format where pixels are either fully transparent or fully opaque. RGBA data at 4 bits per pixel.
---@field EACr integer # The single-channel variant of the EAC format. Stores just the red channel, at 4 bits per pixel.
---@field EACrs integer # The signed single-channel variant of the EAC format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---@field EACrg integer # The two-channel variant of the EAC format. Stores red and green channels at 8 bits per pixel.
---@field EACrgs integer # The signed two-channel variant of the EAC format.
---@field PVR1rgb2 integer # The 2 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 2 bits per pixel. Textures compressed with PVRTC1 formats must be square and power-of-two sized.
---@field PVR1rgb4 integer # The 4 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 4 bits per pixel.
---@field PVR1rgba2 integer # The 2 bit per pixel RGBA variant of the PVRTC1 format.
---@field PVR1rgba4 integer # The 4 bit per pixel RGBA variant of the PVRTC1 format.
---@field ASTC4x4 integer # The 4x4 pixels per block variant of the ASTC format. RGBA data at 8 bits per pixel.
---@field ASTC5x4 integer # The 5x4 pixels per block variant of the ASTC format. RGBA data at 6.4 bits per pixel.
---@field ASTC5x5 integer # The 5x5 pixels per block variant of the ASTC format. RGBA data at 5.12 bits per pixel.
---@field ASTC6x5 integer # The 6x5 pixels per block variant of the ASTC format. RGBA data at 4.27 bits per pixel.
---@field ASTC6x6 integer # The 6x6 pixels per block variant of the ASTC format. RGBA data at 3.56 bits per pixel.
---@field ASTC8x5 integer # The 8x5 pixels per block variant of the ASTC format. RGBA data at 3.2 bits per pixel.
---@field ASTC8x6 integer # The 8x6 pixels per block variant of the ASTC format. RGBA data at 2.67 bits per pixel.
---@field ASTC8x8 integer # The 8x8 pixels per block variant of the ASTC format. RGBA data at 2 bits per pixel.
---@field ASTC10x5 integer # The 10x5 pixels per block variant of the ASTC format. RGBA data at 2.56 bits per pixel.
---@field ASTC10x6 integer # The 10x6 pixels per block variant of the ASTC format. RGBA data at 2.13 bits per pixel.
---@field ASTC10x8 integer # The 10x8 pixels per block variant of the ASTC format. RGBA data at 1.6 bits per pixel.
---@field ASTC10x10 integer # The 10x10 pixels per block variant of the ASTC format. RGBA data at 1.28 bits per pixel.
---@field ASTC12x10 integer # The 12x10 pixels per block variant of the ASTC format. RGBA data at 1.07 bits per pixel.
---@field ASTC12x12 integer # The 12x12 pixels per block variant of the ASTC format. RGBA data at 0.89 bits per pixel.

---@class love.ImageFormat
---@field tga integer # Targa image format.
---@field png integer # PNG image format.
---@field jpg integer # JPG image format.
---@field bmp integer # BMP image format.

---@class love.PixelFormat
---@field unknown integer # Indicates unknown pixel format, used internally.
---@field normal integer # Alias for rgba8, or srgba8 if gamma-correct rendering is enabled.
---@field hdr integer # A format suitable for high dynamic range content - an alias for the rgba16f format, normally.
---@field r8 integer # Single-channel (red component) format (8 bpp).
---@field rg8 integer # Two channels (red and green components) with 8 bits per channel (16 bpp).
---@field rgba8 integer # 8 bits per channel (32 bpp) RGBA. Color channel values range from 0-255 (0-1 in shaders).
---@field srgba8 integer # gamma-correct version of rgba8.
---@field r16 integer # Single-channel (red component) format (16 bpp).
---@field rg16 integer # Two channels (red and green components) with 16 bits per channel (32 bpp).
---@field rgba16 integer # 16 bits per channel (64 bpp) RGBA. Color channel values range from 0-65535 (0-1 in shaders).
---@field r16f integer # Floating point single-channel format (16 bpp). Color values can range from [-65504, +65504].
---@field rg16f integer # Floating point two-channel format with 16 bits per channel (32 bpp). Color values can range from [-65504, +65504].
---@field rgba16f integer # Floating point RGBA with 16 bits per channel (64 bpp). Color values can range from [-65504, +65504].
---@field r32f integer # Floating point single-channel format (32 bpp).
---@field rg32f integer # Floating point two-channel format with 32 bits per channel (64 bpp).
---@field rgba32f integer # Floating point RGBA with 32 bits per channel (128 bpp).
---@field la8 integer # Same as rg8, but accessed as (L, L, L, A)
---@field rgba4 integer # 4 bits per channel (16 bpp) RGBA.
---@field rgb5a1 integer # RGB with 5 bits each, and a 1-bit alpha channel (16 bpp).
---@field rgb565 integer # RGB with 5, 6, and 5 bits each, respectively (16 bpp). There is no alpha channel in this format.
---@field rgb10a2 integer # RGB with 10 bits per channel, and a 2-bit alpha channel (32 bpp).
---@field rg11b10f integer # Floating point RGB with 11 bits in the red and green channels, and 10 bits in the blue channel (32 bpp). There is no alpha channel. Color values can range from [0, +65024].
---@field stencil8 integer # No depth buffer and 8-bit stencil buffer.
---@field depth16 integer # 16-bit depth buffer and no stencil buffer.
---@field depth24 integer # 24-bit depth buffer and no stencil buffer.
---@field depth32f integer # 32-bit float depth buffer and no stencil buffer.
---@field depth24stencil8 integer # 24-bit depth buffer and 8-bit stencil buffer.
---@field depth32fstencil8 integer # 32-bit float depth buffer and 8-bit stencil buffer.
---@field DXT1 integer # The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images on desktop systems.
---@field DXT3 integer # The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.
---@field DXT5 integer # The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on desktop systems.
---@field BC4 integer # The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.
---@field BC4s integer # The signed variant of the BC4 format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---@field BC5 integer # The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.
---@field BC5s integer # The signed variant of the BC5 format.
---@field BC6h integer # The BC6H format. Stores half-precision floating-point RGB data in the range of 65504 at 8 bits per pixel. Suitable for HDR images on desktop systems.
---@field BC6hs integer # The signed variant of the BC6H format. Stores RGB data in the range of +65504.
---@field BC7 integer # The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.
---@field ETC1 integer # The ETC1 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on older Android devices.
---@field ETC2rgb integer # The RGB variant of the ETC2 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on newer mobile devices.
---@field ETC2rgba integer # The RGBA variant of the ETC2 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on newer mobile devices.
---@field ETC2rgba1 integer # The RGBA variant of the ETC2 format where pixels are either fully transparent or fully opaque. RGBA data at 4 bits per pixel.
---@field EACr integer # The single-channel variant of the EAC format. Stores just the red channel, at 4 bits per pixel.
---@field EACrs integer # The signed single-channel variant of the EAC format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.
---@field EACrg integer # The two-channel variant of the EAC format. Stores red and green channels at 8 bits per pixel.
---@field EACrgs integer # The signed two-channel variant of the EAC format.
---@field PVR1rgb2 integer # The 2 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 2 bits per pixel. Textures compressed with PVRTC1 formats must be square and power-of-two sized.
---@field PVR1rgb4 integer # The 4 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 4 bits per pixel.
---@field PVR1rgba2 integer # The 2 bit per pixel RGBA variant of the PVRTC1 format.
---@field PVR1rgba4 integer # The 4 bit per pixel RGBA variant of the PVRTC1 format.
---@field ASTC4x4 integer # The 4x4 pixels per block variant of the ASTC format. RGBA data at 8 bits per pixel.
---@field ASTC5x4 integer # The 5x4 pixels per block variant of the ASTC format. RGBA data at 6.4 bits per pixel.
---@field ASTC5x5 integer # The 5x5 pixels per block variant of the ASTC format. RGBA data at 5.12 bits per pixel.
---@field ASTC6x5 integer # The 6x5 pixels per block variant of the ASTC format. RGBA data at 4.27 bits per pixel.
---@field ASTC6x6 integer # The 6x6 pixels per block variant of the ASTC format. RGBA data at 3.56 bits per pixel.
---@field ASTC8x5 integer # The 8x5 pixels per block variant of the ASTC format. RGBA data at 3.2 bits per pixel.
---@field ASTC8x6 integer # The 8x6 pixels per block variant of the ASTC format. RGBA data at 2.67 bits per pixel.
---@field ASTC8x8 integer # The 8x8 pixels per block variant of the ASTC format. RGBA data at 2 bits per pixel.
---@field ASTC10x5 integer # The 10x5 pixels per block variant of the ASTC format. RGBA data at 2.56 bits per pixel.
---@field ASTC10x6 integer # The 10x6 pixels per block variant of the ASTC format. RGBA data at 2.13 bits per pixel.
---@field ASTC10x8 integer # The 10x8 pixels per block variant of the ASTC format. RGBA data at 1.6 bits per pixel.
---@field ASTC10x10 integer # The 10x10 pixels per block variant of the ASTC format. RGBA data at 1.28 bits per pixel.
---@field ASTC12x10 integer # The 12x10 pixels per block variant of the ASTC format. RGBA data at 1.07 bits per pixel.
---@field ASTC12x12 integer # The 12x12 pixels per block variant of the ASTC format. RGBA data at 0.89 bits per pixel.
