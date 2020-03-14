//
//  CowsayCommand.swift
//  App
//
//  Created by aseo on 2020/03/15.
//

import Vapor
import Command


/// Generates ASCII picture of a cow with a message.
struct CowsayCommand: Command {
    
    /// See `Command`
    var help: [String] {
        return ["Generates ASCII picture of a cow with a message."]
    }
    
    /// See `Command`
    var arguments: [CommandArgument] {
        return [.argument(name: "message")]
    }

    /// See `Command`
    var options: [CommandOption] {
        return [
            .value(name: "eyes", short: "e", default: "oo", help: ["Change cow's eyes"]),
            .value(name: "tongue", short: "t", default: " ", help: ["Change cow's tongue"]),
        ]
    }
    
    func run(using context: CommandContext) throws -> EventLoopFuture<Void> {
        let message = try context.argument("message")
        /// We can use requireOption here since both options have default values
        let eyes = try context.requireOption("eyes")
        let tongue = try context.requireOption("tongue")
        let padding = String(repeating: "-", count: message.count)
        let text: String = """
          \(padding)
        < \(message) >
          \(padding)
                  \\   ^__^
                   \\  (\(eyes)\\_______
                      (__)\\       )\\/\\
                        \(tongue)  ||----w |
                           ||     ||
        """
        context.console.print(text)
        return .done(on: context.container)
    }
}
