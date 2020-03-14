import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return try req.view().render("hello", ["name": "Leaf"])
    }
    
    router.get("todos") { req -> EventLoopFuture<View> in
        return try req.view().render("index", ["todos": Todo.query(on: req).all()])
    }
    
    router.get("add") { req -> Future<View> in
        return try req.view().render("add", ["name": "Leaf"])
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
