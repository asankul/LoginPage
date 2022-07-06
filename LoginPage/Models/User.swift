//
//  Person.swift
//  LoginPage
//
//  Created by Асанкул Садыков on 6/7/22.
//

struct User {
    let username: String
    let password: String
    let persons: [Person]
    
    static func getPersons() -> [User] {
        [
            User(
                username: "Asankul",
                password: "Asankul",
                persons: [
                    Person(
                        name: "Asankul Sadykov",
                        country: "Cyprus",
                        phone: "123456",
                        job: "QA",
                        description: "Study swift programming language"
                    )
                ]
            ),
            User(
                username: "Aiperi",
                password: "Aiperi",
                persons: [
                    Person(
                        name: "Aiperi Sadykova",
                        country: "Greece",
                        phone: "654321",
                        job: "Tech support lead",
                        description: "Working in It company"
                    )
                ]
            )
        ]
    }
    
}

struct Person {
    let name: String
    let country: String
    let phone: String
    let job: String
    let description: String
}
