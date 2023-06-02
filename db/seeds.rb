User.create(name: 'Shakir', email: 'shakir@gmail.com', password: 'hussain', confirmed_at: Time.now)
Category.create(name: 'RPG',
                       description: "A role-playing game (RPG) is a game in which each participant assumes the role of a character, generally in a fantasy or science fiction setting, that can interact within the game's imaginary world.", icon: 'data:image/png;base64,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', created_at: Time.now, updated_at: Time.now, user_id: 1)
Categories.create(name: 'MMORPG',
                       description: 'A massively multiplayer online role-playing game (MMORPG) is a video game that takes place in a persistent state world (PSW) with thousands, or even millions, of players developing their characters in a role-playing environment. The virtual world in which the game takes place is never static.', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9QbNl6LbSKMgfG-2dSH7_B644SloAjbDlZw&usqp=CAU', created_at: Time.now, updated_at: Time.now, user_id: 1)
