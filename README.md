# Deliverer-Swift

Easy to use Swift library for live streaming to social media and content platforms such as Youtube, Facebook, Twitch, Periscope or on CDNS such as Wowza, Azure, AWS Elemental MediaLive or on your custom RTMP server based on nginx, red5, unreal media server and many more.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate deliverer into your Xcode project using CocoaPods, specify it in your `Podfile`:

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

## Quick Start

### 1. Create the camera input

We can use `CameraInput.defaultCamera()` to get a preconfigured instance of the camera that we can customize later. The default camera is the ***back camera*** in ***portrait mode*** with ***720p*** resolution.

```swift

// We use camera as input
do {
    cameraInput = try CameraInput.defaultCamera()
} catch let error as CameraDeviceError {
    switch error {
    case .noDevice:
        print("No device, probably you are using a simulator")
        return
    }
} catch {
    print("Some other device error")
    return
}
 
```

Now we can configure the camera as needed.

```swift

cameraInput.fittingMode = .pad
cameraInput.autorotate = true
try? cameraInput.setResolution(sessionPresent: .hd1280x720)
 
```

Then we can add the camera view to our view hierrachy

```swift

// Place the camera feed wherever you want it
cameraInput.cameraView.frame = view.bounds
cameraInput.cameraView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
view.insertSubview(cameraInput.cameraView, at: 0)
 
```

Next we create the `deliverer` instance and we add the the `cameraInput` as its input source.

```swift

var deliverer = Deliverer()
// Add camera as input to the streamer
deliverer.addInput(input: cameraInput)
 
```

After inputs and settings are set on the `deliverer` we must call the `configure()` method to configure itself based on given settings and input.

```swift

// Configure the streamer with the settings you gave (or default ones if none are given) settings
do {
    try deliverer.configure()
} catch {
    print("Failed to configure streamer")
    return
}
 
```

If the call succedes everything is configured properly and we can proceed to start the camera, add streaming endpoints and start the encoding.

```swift

// Start the camera
cameraInput.startCamera()

// Add a streaming endpoint
let streamingEndpoint = StreamingEndpoint(url: "rtmp://35.167.110.26:1935/live/test")
try? deliverer.addStreamingEndpoint(endpoint: streamingEndpoint)

// Start the encoding
deliverer.startEncoding()

...

// Stop the encoding
deliverer.stopEncoding()
 
```
