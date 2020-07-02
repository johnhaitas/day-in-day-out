//
//  LaunchAtLogin.swift
//  DaysSince
//
//  Created by Dominik Pich on 7/1/20.
//

import Foundation
import ServiceManagement

public struct LaunchAtLogin {
  private static let launcherIdentifier = "\(Bundle.main.bundleIdentifier!)Launcher"

  public static var isEnabled: Bool {
    get {
      guard let enabledLauncher = UserDefaults.standard.string(forKey: "enabledLauncher") else {
        return false
      }
      return enabledLauncher == launcherIdentifier
    }
    set {
      if newValue {
        UserDefaults.standard.setValue(launcherIdentifier, forKey: "enabledLauncher")
      } else {
        UserDefaults.standard.removeObject(forKey: "enabledLauncher")
      }
      SMLoginItemSetEnabled(launcherIdentifier as CFString, newValue)
    }
  }
}
