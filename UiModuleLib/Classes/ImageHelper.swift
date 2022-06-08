import UIKit
class ImageHelper {
    
    static private func bundle () -> Bundle {
        let bundle = Bundle(for: Self.self)
        
        let path = bundle.url(forResource: "Mybundle", withExtension: "bundle")!
        
        return Bundle(url: path)!
        
    }
    
    static func image (named: String) -> UIImage {
        return UIImage(named: named, in: bundle(), compatibleWith: nil) ?? UIImage()
    }
}

