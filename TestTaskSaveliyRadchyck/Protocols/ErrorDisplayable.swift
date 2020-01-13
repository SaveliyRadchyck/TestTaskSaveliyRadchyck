//
//  ErrorDisplayable.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//


import UIKit

protocol ErrorDisplayable: UIAccessibilityIdentification {
    var error: Error? { get set }
}
