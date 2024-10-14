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
        "kys",
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
        "За Путина!",
        "Еще разок",
        "Торчу",
        "Не смог",
        "Бросить",
        "Торфяной оазис",
        "Дряной мотель",
        "Что-то не так",
        "Не вписался"
    ])
]
