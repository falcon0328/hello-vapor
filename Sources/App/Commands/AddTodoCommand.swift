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
            let index: Int = Int.random(in: 1 ... 100000000)
            return Todo(id: index, title: "title\(index)").create(on: db).transform(to: ())
        }
    }
}
