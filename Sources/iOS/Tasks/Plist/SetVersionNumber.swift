//
//  SetVersionNumber.swift
//  Puma
//
//  Created by khoa on 15/04/2019.
//  Copyright © 2019 PumaSwift. All rights reserved.
//

import Foundation
import PumaCore

public class SetVersionNumber {
    public var isEnabled = true
    public var agvtool = Agvtool()

    public init(_ closure: (SetVersionNumber) -> Void = { _ in }) {
        closure(self)
    }
}

extension SetVersionNumber: Task {
    public var name: String { "Set version number" }

    public func run(workflow: Workflow, completion: TaskCompletion) {
        with(completion) {
            try agvtool.run(workflow: workflow)
        }
    }
}

public extension SetVersionNumber {
    func versionNumberForAllTargets(_ version: String) {
        agvtool.arguments.append(contentsOf: [
            "new-marketing-version",
            version
        ])
    }
}
