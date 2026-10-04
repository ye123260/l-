Add-Type -AssemblyName System.Drawing

$imagesDir = Join-Path $PSScriptRoot "images"

function Create-SimpleIcon {
    param(
        [string]$Path,
        [string]$BgColor,
        [string]$IconColor,
        [string]$Shape
    )
    
    $bitmap = New-Object System.Drawing.Bitmap(81, 81)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    
    $bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml($BgColor))
    $graphics.FillRectangle($bgBrush, 0, 0, 81, 81)
    
    $pen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml($IconColor), 4)
    
    if ($Shape -eq "home") {
        $pen.Color = [System.Drawing.ColorTranslator]::FromHtml($IconColor)
        $graphics.DrawLine($pen, 40, 15, 15, 40)
        $graphics.DrawLine($pen, 40, 15, 65, 40)
        $graphics.DrawLine($pen, 15, 40, 15, 65)
        $graphics.DrawLine($pen, 65, 40, 65, 65)
        $graphics.DrawLine($pen, 15, 65, 65, 65)
        $graphics.DrawLine($pen, 33, 65, 33, 48)
        $graphics.DrawLine($pen, 48, 65, 48, 48)
        $graphics.DrawLine($pen, 33, 48, 48, 48)
    } elseif ($Shape -eq "user") {
        $circleBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml($IconColor))
        $graphics.FillEllipse($circleBrush, 28, 15, 25, 25)
        $graphics.FillPie($circleBrush, 15, 42, 51, 35, 180, 180)
    }
    
    $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
    $pen.Dispose()
}

Create-SimpleIcon -Path "$imagesDir\home.png" -BgColor "#E0E0E0" -IconColor "#999999" -Shape "home"
Create-SimpleIcon -Path "$imagesDir\home-active.png" -BgColor "#FFF0F0" -IconColor "#FF6B6B" -Shape "home"
Create-SimpleIcon -Path "$imagesDir\mine.png" -BgColor "#E0E0E0" -IconColor "#999999" -Shape "user"
Create-SimpleIcon -Path "$imagesDir\mine-active.png" -BgColor "#FFF0F0" -IconColor "#FF6B6B" -Shape "user"

$avatarBitmap = New-Object System.Drawing.Bitmap(81, 81)
$avatarGraphics = [System.Drawing.Graphics]::FromImage($avatarBitmap)
$avatarGraphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$avatarBgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(224, 224, 224))
$avatarGraphics.FillRectangle($avatarBgBrush, 0, 0, 81, 81)
$avatarCircleBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(153, 153, 153))
$avatarGraphics.FillEllipse($avatarCircleBrush, 28, 15, 25, 25)
$avatarGraphics.FillPie($avatarCircleBrush, 15, 42, 51, 35, 180, 180)
$avatarBitmap.Save("$imagesDir\default-avatar.png", [System.Drawing.Imaging.ImageFormat]::Png)
$avatarGraphics.Dispose()
$avatarBitmap.Dispose()

Write-Host "Icons created successfully!"
