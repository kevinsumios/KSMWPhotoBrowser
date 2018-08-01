Pod::Spec.new do |s|

  s.name = 'KSMWPhotoBrowser'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A simple iOS photo and video browser with optional grid view, captions, selections and share/delete action, extend from MWPhotoBrowser.'
  s.description = <<-DESCRIPTION
                  KSMWPhotoBrowser is an extension from MWPhotoBrowser to support updated dependencies, and
                  add shared and delete button for more use cases.
                  MWPhotoBrowser can display one or more images or videos by providing either UIImage
                  objects, PHAsset objects, or URLs to library assets, web images/videos or local files.
                  The photo browser handles the downloading and caching of photos from the web seamlessly.
                  Photos can be zoomed and panned, and optional (customisable) captions can be displayed.
                  DESCRIPTION
  s.screenshots = [
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser1.png',
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser2.png',
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser3.png',
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser4.png',
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser5.png',
    'https://raw.githubusercontent.com/kevinsumios/KSMWPhotoBrowser/master/Screenshots/MWPhotoBrowser6.png'
  ]

  s.homepage = 'https://github.com/kevinsumios/KSMWPhotoBrowser'
  s.author = { 'Kevin Sum' => 'kevin-sum@hotmail.com' }

  s.source = {
    :git => 'https://github.com/kevinsumios/KSMWPhotoBrowser.git',
    :tag => '1.0.0'
  }
  s.platform = :ios, '8.0'
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'KSMWPhotoBrowser' => ['Pod/Assets/*.png']
  }
  s.requires_arc = true

  s.frameworks = 'ImageIO', 'QuartzCore', 'AssetsLibrary', 'MediaPlayer'
  s.weak_frameworks = 'Photos'

  s.dependency 'MBProgressHUD'
  s.dependency 'DACircularProgress'
  s.dependency 'SDWebImage'

end
