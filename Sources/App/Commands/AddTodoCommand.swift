//
//  AddTodoCommand.swift
//  App
//
//  Created by aseo on 2020/03/15.
//

import Vapor
import Command
import FluentPostgreSQL

struct AddTodoCommand: Command {
    /// See `Command`
    var help: [String] {
        return ["Todoを追加するコマンド"]
    }
    
    /// See `Command`
    var arguments: [CommandArgument] {
        return []
    }

    /// See `Command`
    var options: [CommandOption] {
        return []
    }
    
    func run(using context: CommandContext) throws -> EventLoopFuture<Void> {
        return context.container.withNewConnection(to: .psql) { db in
            let index: Int = Int(arc4random())
            return Todo(id: index, title: "title\(arc4random())").create(on: db).transform(to: ())
        }
    }
}
