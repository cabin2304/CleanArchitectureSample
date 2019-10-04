//
//  Validation.swift
//  ServiceKit
//

import Foundation

public struct Validation {

  public static func username(_ username: String) -> Bool {
    //  - Lowercasecharacters{a-z}
    //  - Uppercasecharacters{A-Z}
    //  - Numbers{0-9}
    //  - Dash{-}
    //  - Underscore{_}
    let userNameRegEx = "\\A[a-zA-Z0-9_-]{3,15}\\z"
    let userNameTest = NSPredicate(format:"SELF MATCHES %@", userNameRegEx)
    return userNameTest.evaluate(with: username)
  }

  public static func email(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
  }

  // using for validate first and last name
  public static func name(_ name: String) -> Bool {
    //  - Lowercase characters {a-z}
    //  - Uppercase characters {A-Z}
    //  - Dash {-}
    let userNameRegEx = "\\A[a-zA-Z-]{1,}\\z"
    let userNameTest = NSPredicate(format:"SELF MATCHES %@", userNameRegEx)
    return userNameTest.evaluate(with: name)
  }

  public static func socialName(_ socialName: String) -> Bool {
    //  - Lowercase characters {a-z}
    //  - Uppercase characters {A-Z} - Digits {0-9}
    //  - Period {.}
    let userNameRegEx = "\\A[a-zA-Z0-9.]{1,}\\z"
    let userNameTest = NSPredicate(format:"SELF MATCHES %@", userNameRegEx)
    return userNameTest.evaluate(with: socialName)
  }
  
  // Using for vaalidate password
  public static func password(_ pwd: String) -> Bool {
    // Password should be at least 8 characters long
    return pwd.count >= 6
  }
}

