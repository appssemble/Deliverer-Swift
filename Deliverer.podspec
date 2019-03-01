Pod::Spec.new do |s|  
    s.name              = 'Deliverer'
    s.version           = '1.0.0'
    s.summary           = 'An easy to use framework for streaming in the apple ecosystem'
    s.homepage          = 'http://appssemble.com/'

    s.author            = { 'Name' => 'appssemble' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => "https://github.com/appssemble/Deliverer-Swift.git" }

    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'Deliverer.framework'
end
