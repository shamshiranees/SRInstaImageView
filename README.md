# SRInstaImageView

[![CI Status](http://img.shields.io/travis/shamshiranees/SRInstaImageView.svg?style=flat)](https://travis-ci.org/shamshiranees/SRInstaImageView)
[![Version](https://img.shields.io/cocoapods/v/SRInstaImageView.svg?style=flat)](http://cocoapods.org/pods/SRInstaImageView)
[![License](https://img.shields.io/cocoapods/l/SRInstaImageView.svg?style=flat)](http://cocoapods.org/pods/SRInstaImageView)
[![Platform](https://img.shields.io/cocoapods/p/SRInstaImageView.svg?style=flat)](http://cocoapods.org/pods/SRInstaImageView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Swift 3.0+ <br>
Xcode 8.0+ <br>


## Installation
 To install it, simply add the following line to your Podfile:

```ruby
pod 'SRInstaImageView'
```
or add [SRInstaImageView.swift](https://github.com/shamshiranees/SRInstaImageView/blob/master/SANotificationViews/Classes/SRInstaImageView.swift) file into your project directory.

## Usage
SRInstaImageView is a subclass of UIImageView which popup a larger imageView on long press and removes it on release(as in instagram).
To use SRInstaImageView change your imageView class to SRInstaImageView.

### If your using in CollectionView
 Change the class of your image view inside  collectionView cell to SRInstaImageView.Then inside cellForItemAt indexPath
 ```Swift
 
 //Pass the image to ImageView
 cell.photoImageView.image = UIImage(named: "\(indexPath.row-8)")
 
 //You should pass the collectionView and the indexPath.
 //Add these 2 line of code inside your cellForItemAt indexPath.
 cell.photoImageView.collectionView = collectionView
 cell.photoImageView.indexPathOFCell = indexPath

 ```
 
 ### If your using in TableView
 Change the class of your image view inside  tableView cell to SRInstaImageView.Then inside cellForRowAt indexPath
 ```Swift
 
 //Pass the image to ImageView
 cell.photoImageView.image = UIImage(named: "\(indexPath.row-8)")
 
 //You should pass the tableView and the indexPath.
 //Add these 2 line of code inside your cellForRowAt indexPath.
 cell.photoImageView.tableView = tableView
 cell.photoImageView.indexPathOFCell = indexPath
 
 ```
 Having any confusion please download the project and run the Example.
## Author

shamshir.anees@gmail.com

## License

SRInstaImageView is available under the MIT license. See the LICENSE file for more info.
