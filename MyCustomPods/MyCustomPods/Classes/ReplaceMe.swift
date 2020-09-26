import Foundation

final class Class {}

let FrameworkBUNDLE = Bundle(for: Class.self)

public func printSayWhat() {
    print("THIS INVOCATION IS FROM POD -- USER DEFINED -- SAY_WHAT", Bundle.main
    .object(forInfoDictionaryKey: "XCCONFIG_SAY_WHAT"))

    print("THIS INVOCATION IS FROM POD -- AUTHOR DEFINED -- MyCustomPods_SAY_DEFINED_FROM_XCCONFIG", FrameworkBUNDLE
        .object(forInfoDictionaryKey: "MyCustomPods_SAY_DEFINED_FROM_XCCONFIG"))
}
