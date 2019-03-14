# Deliverer-Swift

Easy to use Swift library for live streaming to social media and content platforms such as Youtube, Facebook, Twitch, Periscope or on CDNS such as Wowza, Azure, AWS Elemental MediaLive or on your custom RTMP server based on nginx, red5, unreal media server and many more.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate stellar SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'Deliverer', '~> 1.0.2'
end
```

Then, run the following command:

```bash
$ pod repo update
$ pod install
```

### Manual

1. Add the `.framework` file to your project by drag and droping it in the project navigator.
2. In your main `.xcodeproj` file, select the desired target(s).
3. Go to **Build Phases**, expand Target Dependencies, and add `Deliverer`.
4. Press the ***+*** button and select ***New copy files phase***.
5. Expand the copy files phase you just create and for ***Destination*** select ***Frameworks*** and add `Deliverer.framework` to the empty list below.
6. In Swift, `import Deliverer` and you are good to go! 

