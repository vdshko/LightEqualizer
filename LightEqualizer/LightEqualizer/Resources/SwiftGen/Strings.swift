// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Controls {
    public enum BackgroundColor {
      /// Background color
      public static let title = L10n.tr("Localizable", "controls.backgroundColor.title")
    }
    public enum Brightness {
      /// Brightness
      public static let title = L10n.tr("Localizable", "controls.brightness.title")
    }
    public enum Flashlight {
      /// Flashlight
      public static let title = L10n.tr("Localizable", "controls.flashlight.title")
    }
  }

  public enum PopUp {
    public enum Hint {
      /// Tap on the screen to hide/show controls.
      public static let title = L10n.tr("Localizable", "popUp.hint.title")
    }
  }

  public enum Root {
    /// Light Equalizer
    public static let title = L10n.tr("Localizable", "root.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
