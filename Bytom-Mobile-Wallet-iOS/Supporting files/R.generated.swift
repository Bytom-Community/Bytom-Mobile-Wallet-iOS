//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Info.plist`.
    static let infoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "Info", pathExtension: "plist")
    
    /// `bundle.url(forResource: "Info", withExtension: "plist")`
    static func infoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.infoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 27 images.
  struct image {
    /// Image `arrow_down`.
    static let arrow_down = Rswift.ImageResource(bundle: R.hostingBundle, name: "arrow_down")
    /// Image `arrow_right`.
    static let arrow_right = Rswift.ImageResource(bundle: R.hostingBundle, name: "arrow_right")
    /// Image `back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "back")
    /// Image `currency_select`.
    static let currency_select = Rswift.ImageResource(bundle: R.hostingBundle, name: "currency_select")
    /// Image `currency`.
    static let currency = Rswift.ImageResource(bundle: R.hostingBundle, name: "currency")
    /// Image `info`.
    static let info = Rswift.ImageResource(bundle: R.hostingBundle, name: "info")
    /// Image `legal_tender`.
    static let legal_tender = Rswift.ImageResource(bundle: R.hostingBundle, name: "legal_tender")
    /// Image `logo_with_title`.
    static let logo_with_title = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo_with_title")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `me_select`.
    static let me_select = Rswift.ImageResource(bundle: R.hostingBundle, name: "me_select")
    /// Image `me`.
    static let me = Rswift.ImageResource(bundle: R.hostingBundle, name: "me")
    /// Image `menu`.
    static let menu = Rswift.ImageResource(bundle: R.hostingBundle, name: "menu")
    /// Image `node`.
    static let node = Rswift.ImageResource(bundle: R.hostingBundle, name: "node")
    /// Image `other_token`.
    static let other_token = Rswift.ImageResource(bundle: R.hostingBundle, name: "other_token")
    /// Image `qrcode_darkgray`.
    static let qrcode_darkgray = Rswift.ImageResource(bundle: R.hostingBundle, name: "qrcode_darkgray")
    /// Image `qrcode_gray`.
    static let qrcode_gray = Rswift.ImageResource(bundle: R.hostingBundle, name: "qrcode_gray")
    /// Image `record`.
    static let record = Rswift.ImageResource(bundle: R.hostingBundle, name: "record")
    /// Image `round_select`.
    static let round_select = Rswift.ImageResource(bundle: R.hostingBundle, name: "round_select")
    /// Image `round`.
    static let round = Rswift.ImageResource(bundle: R.hostingBundle, name: "round")
    /// Image `scan_darkgray`.
    static let scan_darkgray = Rswift.ImageResource(bundle: R.hostingBundle, name: "scan_darkgray")
    /// Image `scan_gray`.
    static let scan_gray = Rswift.ImageResource(bundle: R.hostingBundle, name: "scan_gray")
    /// Image `share`.
    static let share = Rswift.ImageResource(bundle: R.hostingBundle, name: "share")
    /// Image `transfer_in`.
    static let transfer_in = Rswift.ImageResource(bundle: R.hostingBundle, name: "transfer_in")
    /// Image `transfer_out`.
    static let transfer_out = Rswift.ImageResource(bundle: R.hostingBundle, name: "transfer_out")
    /// Image `transfer`.
    static let transfer = Rswift.ImageResource(bundle: R.hostingBundle, name: "transfer")
    /// Image `wallet_darkgray`.
    static let wallet_darkgray = Rswift.ImageResource(bundle: R.hostingBundle, name: "wallet_darkgray")
    /// Image `wallet_white`.
    static let wallet_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "wallet_white")
    
    /// `UIImage(named: "arrow_down", bundle: ..., traitCollection: ...)`
    static func arrow_down(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrow_down, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "arrow_right", bundle: ..., traitCollection: ...)`
    static func arrow_right(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arrow_right, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "currency", bundle: ..., traitCollection: ...)`
    static func currency(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.currency, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "currency_select", bundle: ..., traitCollection: ...)`
    static func currency_select(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.currency_select, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "info", bundle: ..., traitCollection: ...)`
    static func info(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.info, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "legal_tender", bundle: ..., traitCollection: ...)`
    static func legal_tender(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.legal_tender, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo_with_title", bundle: ..., traitCollection: ...)`
    static func logo_with_title(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo_with_title, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "me", bundle: ..., traitCollection: ...)`
    static func me(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.me, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "me_select", bundle: ..., traitCollection: ...)`
    static func me_select(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.me_select, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "menu", bundle: ..., traitCollection: ...)`
    static func menu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.menu, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "node", bundle: ..., traitCollection: ...)`
    static func node(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.node, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "other_token", bundle: ..., traitCollection: ...)`
    static func other_token(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.other_token, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "qrcode_darkgray", bundle: ..., traitCollection: ...)`
    static func qrcode_darkgray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.qrcode_darkgray, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "qrcode_gray", bundle: ..., traitCollection: ...)`
    static func qrcode_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.qrcode_gray, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "record", bundle: ..., traitCollection: ...)`
    static func record(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.record, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "round", bundle: ..., traitCollection: ...)`
    static func round(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.round, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "round_select", bundle: ..., traitCollection: ...)`
    static func round_select(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.round_select, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "scan_darkgray", bundle: ..., traitCollection: ...)`
    static func scan_darkgray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.scan_darkgray, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "scan_gray", bundle: ..., traitCollection: ...)`
    static func scan_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.scan_gray, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "share", bundle: ..., traitCollection: ...)`
    static func share(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.share, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "transfer", bundle: ..., traitCollection: ...)`
    static func transfer(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.transfer, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "transfer_in", bundle: ..., traitCollection: ...)`
    static func transfer_in(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.transfer_in, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "transfer_out", bundle: ..., traitCollection: ...)`
    static func transfer_out(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.transfer_out, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "wallet_darkgray", bundle: ..., traitCollection: ...)`
    static func wallet_darkgray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wallet_darkgray, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "wallet_white", bundle: ..., traitCollection: ...)`
    static func wallet_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wallet_white, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 6 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Me`.
    static let me = _R.storyboard.me()
    /// Storyboard `Trade`.
    static let trade = _R.storyboard.trade()
    /// Storyboard `Wallet`.
    static let wallet = _R.storyboard.wallet()
    /// Storyboard `Welcome`.
    static let welcome = _R.storyboard.welcome()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Me", bundle: ...)`
    static func me(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.me)
    }
    
    /// `UIStoryboard(name: "Trade", bundle: ...)`
    static func trade(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.trade)
    }
    
    /// `UIStoryboard(name: "Wallet", bundle: ...)`
    static func wallet(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.wallet)
    }
    
    /// `UIStoryboard(name: "Welcome", bundle: ...)`
    static func welcome(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.welcome)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MainTabBarController
      
      let bundle = R.hostingBundle
      let mainTabBarController = StoryboardViewControllerResource<MainTabBarController>(identifier: "MainTabBarController")
      let name = "Main"
      
      func mainTabBarController(_: Void = ()) -> MainTabBarController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainTabBarController)
      }
      
      static func validate() throws {
        if _R.storyboard.main().mainTabBarController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainTabBarController' could not be loaded from storyboard 'Main' as 'MainTabBarController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct me: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Me"
      
      fileprivate init() {}
    }
    
    struct trade: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Trade"
      
      fileprivate init() {}
    }
    
    struct wallet: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Wallet"
      
      fileprivate init() {}
    }
    
    struct welcome: Rswift.StoryboardResourceType {
      let bundle = R.hostingBundle
      let name = "Welcome"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
