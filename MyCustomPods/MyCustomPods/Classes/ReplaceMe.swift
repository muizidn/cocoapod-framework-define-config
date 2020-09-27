import Foundation

final class Class {}

let BundleOfMyCustomPods = Bundle(for: Class.self)

let BundleOfMyCustomPods_Bundle = Bundle(
    path: BundleOfMyCustomPods.bundlePath + "/MyCustomPods_Bundle.bundle")

public func printSayWhat() {
    print("BUNDLE MyCustomPods", BundleOfMyCustomPods.bundleIdentifier)
    print("BUNDLE MyCustomPods-Bundle", BundleOfMyCustomPods_Bundle?.bundleIdentifier)
    
    print("THIS INVOCATION IS FROM POD -- USER DEFINED -- SAY_WHAT", Bundle.main
    .object(forInfoDictionaryKey: "XCCONFIG_SAY_WHAT"))

    print("THIS INVOCATION IS FROM POD -- AUTHOR DEFINED -- MyCustomPods_SAY_DEFINED_FROM_XCCONFIG", BundleOfMyCustomPods
        .object(forInfoDictionaryKey: "MyCustomPods_SAY_DEFINED_FROM_XCCONFIG"))
}

public class FontLoader {
    private enum Error: Swift.Error {
        case error(String)
    }
    
    /// Register fonts
    ///
    /// - Parameter fonts: Font names
    static func registerFonts(fonts: [String], in bundle: Bundle? = nil) throws {
        let bundle = bundle ?? Bundle(for: FontLoader.self)
        let urls = fonts.compactMap({ bundle.url(forResource: $0, withExtension: "ttf") })
        try urls.forEach { (url) in
            print("FONT URL", url)
            let data = try Data.init(contentsOf: url)
            guard let provider = CGDataProvider.init(data: data as CFData) else { throw Error.error("CGDataProvider nil") }
            guard let font = CGFont.init(provider) else { throw Error.error("CGFont nil") }
            var error: Unmanaged<CFError>?
            guard CTFontManagerRegisterGraphicsFont(font, &error) else {
                throw error!.takeUnretainedValue()
            }
        }
    }
}



/// Call this once otherwise FontLoader throw error
public func FW_myCustomPodsConfigure() throws {
    /// I can't register from Info.plist, so I load it here
    try FontLoader.registerFonts(fonts: [
        "Roboto-BoldItalic"
    ],in: BundleOfMyCustomPods_Bundle)
}
