// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
  public enum Assets {
    public static let launchScreen = ImageAsset(name: "LaunchScreen")
  }
  public enum Colors {
    public enum Base {
      public static let black = ColorAsset(name: "Base/black")
      public static let white = ColorAsset(name: "Base/white")
    }
    public enum PopUp {
      public static let background = ColorAsset(name: "PopUp/background")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ColorAsset {
  fileprivate let name: String

  public var color: Color {
    Color(self)
  }
  public var uiColor: UIColor {
    UIColor(color)
  }
}

public extension Color {
  /// Creates a named color.
  /// - Parameter asset: the color resource to lookup.
  init(_ asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

extension View {

    /// Sets the color of the foreground elements displayed by this view.
    @inlinable public func foregroundColor(_ color: ColorAsset) -> some View {
        return foregroundColor(color.color)
    }
    /// Sets the color of the accent elements displayed by this view.
    @inlinable public func accentColor(_ color: ColorAsset) -> some View {
        return accentColor(color.color)
    }
}

extension Text {

    /// Sets the color of the foreground elements displayed by this text.
    @inlinable public func foregroundColor(_ color: ColorAsset) -> Text {
        return foregroundColor(color.color)
    }
}

public struct ImageAsset {
  fileprivate let name: String

  public var image: Image {
    Image(name)
  }
  public var uiImage: UIImage? {
    UIImage(named: name)
  }
}

public extension Image {
  /// Creates a labeled image that you can use as content for controls.
  /// - Parameter asset: the image resource to lookup.
  init(_ asset: ImageAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

private final class BundleToken {}
