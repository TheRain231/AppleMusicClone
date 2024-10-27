//
//  Model.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import Foundation

struct Album: Hashable{
    let imageName: String
    let text: String
    let artist: String
    let songs: [String]
}

let albums: [Album] = [
    Album(imageName: "kiss", text: "Never love you", artist: "K1SS", songs: [
        "i'm kissman",
        "pink guy",
        "red fella",
        "goodbye louvre",
        "hello chinatown",
        "still fucking doll",
        "vegetable addiction",
        "love to elders"
    ]),
    Album(imageName: "morgenstern", text: "Turn it left!", artist: "MORGENSHTREN", songs: [
        "ем бабку",
        "эпическая грязь",
        "голубоглазые деффки",
        "пять евреев",
        "Е!ВАННАЯ",
        "Blizko",
        "SWatch"
    ]),
    Album(imageName: "neverlove", text: "Альтушка", artist: "NEVERHATE", songs: [
        "масик",
        "пупсик",
        "комфортик",
        "дядя",
        "лошарик",
        "скуф"
    ]),
    Album(imageName: "pornofilms", text: "Свободные", artist: "LOVEMOVIES", songs: [
        "Еще разок",
        "Шаман",
        "Не смог",
        "Бросить",
        "Торфяной оазис",
        "Дряной мотель",
        "Что-то не так",
        "Не вписался"
    ]),
    Album(imageName: "kitch", text: "Ловец Снов", artist: "КИТЧ", songs: [
        "Вселенная",
        "Кости",
        "Я тебя знаю",
        "Расскажи мне сказку",
        "Обещай мне сниться",
        "Колыбельная"
    ])
]

struct Song: Hashable{
    let album: Album
    let number: Int
}

let songs: [Song] = [
    Song(album: albums[0], number: 0),
    Song(album: albums[0], number: 1),
    Song(album: albums[0], number: 2),
    Song(album: albums[0], number: 3),
    Song(album: albums[0], number: 4),
    Song(album: albums[0], number: 5),
    Song(album: albums[0], number: 6),
    Song(album: albums[0], number: 7),
    
    Song(album: albums[1], number: 0),
    Song(album: albums[1], number: 1),
    Song(album: albums[1], number: 2),
    Song(album: albums[1], number: 3),
    Song(album: albums[1], number: 4),
    Song(album: albums[1], number: 5),
    Song(album: albums[1], number: 6),
    
    Song(album: albums[2], number: 0),
    Song(album: albums[2], number: 1),
    Song(album: albums[2], number: 2),
    Song(album: albums[2], number: 3),
    Song(album: albums[2], number: 4),
    Song(album: albums[2], number: 5),
    
    Song(album: albums[3], number: 0),
    Song(album: albums[3], number: 1),
    Song(album: albums[3], number: 2),
    Song(album: albums[3], number: 3),
    Song(album: albums[3], number: 4),
    Song(album: albums[3], number: 5),
    Song(album: albums[3], number: 6),
    Song(album: albums[3], number: 7),
    
    Song(album: albums[4], number: 0),
    Song(album: albums[4], number: 1),
    Song(album: albums[4], number: 2),
    Song(album: albums[4], number: 3),
    Song(album: albums[4], number: 4),
    Song(album: albums[4], number: 5)
]
