
$sourcePath = "C:/Users/PCUSER/.gemini/antigravity/brain/22c81017-83b7-403a-83ce-50ab9c4bd911/uploaded_image_1768243705353.png"
$destDir = "c:/Users/PCUSER/.gemini/antigravity/scratch/children_nisa_sim"

Add-Type -AssemblyName System.Drawing

function Resize-Image {
    param(
        [string]$Src,
        [string]$Dst,
        [int]$Width,
        [int]$Height,
        [System.Drawing.Imaging.ImageFormat]$Format
    )

    $srcImage = [System.Drawing.Image]::FromFile($Src)
    $newImage = new-object System.Drawing.Bitmap($Width, $Height)
    $g = [System.Drawing.Graphics]::FromImage($newImage)
    
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($srcImage, 0, 0, $Width, $Height)
    
    $newImage.Save($Dst, $Format)
    
    $g.Dispose()
    $newImage.Dispose()
    $srcImage.Dispose()
}

# Generate apple-touch-icon.png (180x180)
$appleDest = Join-Path $destDir "apple-touch-icon.png"
Resize-Image -Src $sourcePath -Dst $appleDest -Width 180 -Height 180 -Format ([System.Drawing.Imaging.ImageFormat]::Png)
Write-Host "Created apple-touch-icon.png"

# Generate favicon.ico (32x32) - Saving as Icon format if possible, or PNG but named .ico (browsers often handle this)
# System.Drawing.Icon.FromHandle is one way, but let's try saving as ICO format.
# System.Drawing.Imaging.ImageFormat.Icon exists.
$faviconDest = Join-Path $destDir "favicon.ico"
Resize-Image -Src $sourcePath -Dst $faviconDest -Width 32 -Height 32 -Format ([System.Drawing.Imaging.ImageFormat]::Icon)
Write-Host "Created favicon.ico"
