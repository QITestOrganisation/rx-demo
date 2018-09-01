#rx-demo
Demo using FRP concepts and unit testing. Written in Swift 4

**Architecture:** MVVM Every UIViewController has its own ViewModel. Similarly, every cell will have its own ViewModelCell. ViewModel is defined in terms of inputs and outputs.

**Inputs**: Published Subject

**Outputs**: Observables

**Dependencies:**
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    pod 'RxSwiftExt'
    pod 'Alamofire', '~> 4.7'
    pod 'RxDataSources', '~> 3.0'
