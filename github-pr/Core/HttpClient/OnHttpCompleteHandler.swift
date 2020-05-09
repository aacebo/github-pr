//
//  OnHttpComplete.swift
//  github-pr
//
//  Created by Alex Acebo on 5/8/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation

typealias OnHttpCompleteHandler = (_ data: Data?, _ response: URLResponse?) -> Void
