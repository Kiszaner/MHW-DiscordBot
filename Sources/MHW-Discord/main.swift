import MHWBotCore
import Sword
import Foundation

guard let token = ProcessInfo.processInfo.environment["DiscordBotToken"] else {
    fatalError("Missing Discord bot token")
}
let bot = Sword(token: token)
let monstersService = MonstersService.make()

bot.editStatus(to: "online", playing: "Monster Hunter World!")

bot.on(.messageCreate) { data in
    let msg = data as! Message
    
    if msg.content == "!monsters" {
        monstersService.getMonsters { result in
            var monsters: String
            switch result {
            case .success(let response):
                monsters = response.map { $0.name }.joined(separator: ",")
            case .failure:
                monsters = "Sadly, monsters are sleeping now and they are not ready to play"
            }
            msg.reply(with: "Estos son los monstruos disponibles por ahora")
            msg.reply(with: monsters)
            var embed = Embed()
            embed.image = Embed.Image(height: 120, proxyUrl: "", url: "https://oyster.ignimgs.com/mediawiki/apis.ign.com/monster-hunter-world/e/e8/LargeMonsters.jpg", width: 120)
            msg.reply(with: embed)
        }
    }
}

bot.connect()
