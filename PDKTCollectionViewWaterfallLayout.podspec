Pod::Spec.new do |s|
  s.name         = 'PDKTCollectionViewWaterfallLayout'
  s.version      = '0.5'
  s.summary      = 'UICollectionViewLayout subclass to get the effect of Waterfall Layout (Popularized by Pinterest).'
  s.homepage     = 'https://github.com/Produkt/PDKTCollectionViewWaterfallLayout'
  s.author       = 'Daniel García'
  s.source       = { :git => 'https://github.com/Produkt/PDKTCollectionViewWaterfallLayout.git', :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.source_files = 'PDKTCollectionViewWaterfallLayout/*.{h,m}'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
  s.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
                This code is distributed under the terms and conditions of the MIT license.

                Permission is hereby granted, free of charge, to any person obtaining a copy of
                this software and associated documentation files (the "Software"), to deal in
                the Software without restriction, including without limitation the rights to
                use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
                the Software, and to permit persons to whom the Software is furnished to do so,
                subject to the following conditions:

                The above copyright notice and this permission notice shall be included in all
                copies or substantial portions of the Software.

                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
                FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
                COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
                IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
                CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    LICENSE
  }
end
