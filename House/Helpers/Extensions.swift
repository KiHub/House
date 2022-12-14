//
//  Extensions.swift
//  House
//
//  Created by  Mr.Ki on 14.12.2022.
//

import Foundation

extension Double {
        static let twoFractionDigits: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }()
        var formatted: String {
            return Double.twoFractionDigits.string(for: self) ?? ""
        }
    }
