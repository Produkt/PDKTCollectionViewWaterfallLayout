## Description

UICollectionViewLayout subclass to get the effect of Waterfall Layout (Popularized by [Pinterest](http://www.pinterest.com/)).

## Sample

![Sample Image](https://raw.github.com/Produkt/PDKTCollectionViewWaterfallLayout/master/readme/demopic1.png)
![Sample Image 2](https://raw.github.com/Produkt/PDKTCollectionViewWaterfallLayout/master/readme/demopic2.png)

## Features

- Multiple sections support
- Every section can have its own number of columns
- Section header and footer support
- Easy configuration: Using properties or delegate protocol implementation
- Automatic cell geometry calculation using aspect ratio instead of sizes

## Usage

Simply add ```PDKTCollectionViewWaterfallLayout.h``` and ```PDKTCollectionViewWaterfallLayout.m``` files to your project and use it as your UICollectionViewLayout

If you are using Interface Builder to configure your Collection View, simply switch “Flow” to “Custom” at the Layout selector. Then set PDKTCollectionViewWaterfallLayout as your CollectionView Layout Class.

![Interface Builder Config](https://raw.github.com/Produkt/PDKTCollectionViewWaterfallLayout/master/readme/ibconfig.png)


## Compatibility
- ```PDKTCollectionViewWaterfallLayout``` is compatible with iOS6.0+
- ```PDKTCollectionViewWaterfallLayout``` requires ARC.

## License
`PDKTCollectionViewWaterfallLayout ` is available under the MIT license. See the LICENSE file for more info.
