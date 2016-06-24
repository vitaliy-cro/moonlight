# USERS #
User.create!(email: 'admin@gmail.com', password: 'password')
Player.first.increment!(:gold, 5555)
# LOCATIONS #
Location.create!(name: 'Moon Light', slug: 'moon_light')
Location.create! [{name: 'Weapon Shop', slug: 'weapon_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Craft Shop', slug: 'craft_shop', parent_id: Location.find_by(slug: 'moon_light').id},
                  {name: 'Wayward Pines', slug: 'wayward_pines'}]

64.times do |t|
  location_name = "#{t} cell"

  case t + 1 
  when 22
    location_name = 'Mycelium'
  when 28 || 29 || 36
    location_name = 'The nearest forest'
  end

  Location.create!(name: "#{location_name}", slug: "#{t+1}", parent_id: Location.find_by(slug: 'wayward_pines').id, cell: true)
end

# EQUIPMENTS
## CATEGORIES
Equipment::Category.create! [{name: 'Head', slug: 'head'},
                             {name: 'Chest', slug: 'chest'},
                             {name: 'Shoulders', slug: 'shoulders'},
                             {name: 'Hands', slug: 'hands'},
                             {name: 'Legs', slug: 'legs'},
                             {name: 'Weapon', slug: 'weapon'},
                             {name: 'Shield', slug: 'shield'}]

## ITEMS
### HEAD
Equipment::Item.create! [{name: 'Gold helm', category_id: Equipment::Category.find_by(slug: 'head').id, attack: 0, defense: 10, hp: 30, required_level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/head/helm.jpg")}]
### CHEST
Equipment::Item.create! [{name: 'Metal chest', category_id: Equipment::Category.find_by(slug: 'chest').id, attack: 0, defense: 50, hp: 50, required_level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/chest/chest.jpg")}]
### SHOULDERS
#Equipment::Item.create! []
### HANDS
#Equipment::Item.create! []
### LEGS
Equipment::Item.create! [{name: 'Metal shoes', category_id: Equipment::Category.find_by(slug: 'legs').id, attack: 10, defense: 10, hp: 10, required_level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/legs/legs.jpg")}]
### WEAPON
Equipment::Item.create! [{name: 'Gold sword', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 5, defense: 2, hp: 20, required_level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/weapon/sword.jpg")},
                         {name: 'Wind staff', category_id: Equipment::Category.find_by(slug: 'weapon').id, attack: 20, defense: 5, hp: 50, required_level: 3, price: 150,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/weapon/wind_staff.jpg")}]
### SHIELD
Equipment::Item.create! [{name: 'Gold shield', category_id: Equipment::Category.find_by(slug: 'shield').id, attack: 0, defense: 20, hp: 30, required_level: 1, price: 50,
                         image: File.new("#{Rails.root}/db/seeds/equipments/items/shield/shield.jpg")}]

# TOOLS
## CATEGORIES
Tool::Category.create! [{name: 'Lumberjacking', slug: 'lumberjacking'},
                        {name: 'Fishing', slug: 'fishing'}]

## ITEMS
### LUMBERJACKING
Tool::Item.create! [{id: 1, name: 'Axe for a beech', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 100, required_skill: 0, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_beech.png")},
                    {id: 2, name: 'Axe for an elm', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 200, required_skill: 50, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_elm.png")},
                    {id: 3, name: 'Axe for a larch', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 400, required_skill: 100, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_larch.png")},
                    {id: 4, name: 'Axe for a birch', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 800, required_skill: 150, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_birch.png")},
                    {id: 5, name: 'Axe for a sequoia', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 1600, required_skill: 200, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_sequoia.png")},
                    {id: 6, name: 'Axe for an eucalyptus', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 3200, required_skill: 250, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_an_eucalyptus.png")},
                    {id: 7, name: 'Axe for a rowan', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 6400, required_skill: 300, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_rowan.png")},
                    {id: 8, name: 'Axe for a mysterious wood', category_id: Tool::Category.find_by(slug: 'lumberjacking').id, price: 12800, required_skill: 350, type: 'lumberjacking',
                    image: File.new("#{Rails.root}/db/seeds/tools/items/lumberjacking/axe_for_a_mysterious_wood.png")}]

# RESOURCES
## LUMBERJACKING
Resource.create! [{name: 'Beech', item_id: Tool::Item.find_by(name: 'Axe for a beech').id, price: 10, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/beech.png")},
                  {name: 'Elm', item_id: Tool::Item.find_by(name: 'Axe for an elm').id, price: 20, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/elm.png")},
                  {name: 'Larch', item_id: Tool::Item.find_by(name: 'Axe for a larch').id, price: 30, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/larch.png")},
                  {name: 'Birch', item_id: Tool::Item.find_by(name: 'Axe for a birch').id, price: 40, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/birch.png")},
                  {name: 'Sequoia', item_id: Tool::Item.find_by(name: 'Axe for a sequoia').id, price: 50, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/sequoia.png")},
                  {name: 'Eucalyptus', item_id: Tool::Item.find_by(name: 'Axe for an eucalyptus').id, price: 60, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/eucalyptus.png")},
                  {name: 'Rowan', item_id: Tool::Item.find_by(name: 'Axe for a rowan').id, price: 70, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/rowan.png")},
                  {name: 'Mysterious_wood', item_id: Tool::Item.find_by(name: 'Axe for a mysterious wood').id, price: 80, type: 'lumberjacking', image: File.new("#{Rails.root}/db/seeds/resources/lumberjacking/mysterious_wood.png")}]

# POPULATE RESOURCES
## LUMBERJACKING
nearest_forest = Location.find_by(name: 'The nearest forest')

LocationResource.create!(location_id: nearest_forest.id, resource_id: Resource.find_by(name: 'Beech').id)
LocationResource.create!(location_id: nearest_forest.id, resource_id: Resource.find_by(name: 'Elm').id)
LocationResource.create!(location_id: nearest_forest.id, resource_id: Resource.find_by(name: 'Larch').id)


# BOTS
Bot::Mushroom.create! [{level: 1, name: 'Armillaria', attack: 10, defense: 10, hp: 10, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/armillaria.jpg")},
                       {level: 2, name: 'Chanterelle', attack: 20, defense: 20, hp: 20, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/chanterelle.jpg")},
                       {level: 3, name: 'Amanita', attack: 30, defense: 30, hp: 30, image: File.new("#{Rails.root}/db/seeds/bots/mushrooms/amanita.jpg")}]

# POPULATE BOTS
locations = Location.all

## MUSHROOMS
mycelium = locations.find_by(name: 'Mycelium')

Bot::Mushroom.all.each do |bot|
  LocationBot.create!(location_id: mycelium.id, bot_id: bot.id)
end