# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([
                    {name: 'Commodity'},
                    {name: 'Stock'},
                    {name: 'Bond'},
                    {name: 'Mutual Fund'},
                    {name: ' Crypto Currency'}
                ])
Item.create([
                {name: 'Gold'},
                {name: 'Amazon'},
                {name: 'Treasury Bond'},
                {name: 'New Consumers Fund'},
                {name: 'BitCoin'},
                {name: 'Ethereum'},
                {name: 'Maker'},
                {name: 'LiteCoin'}
            ])
DataProperty.create([
                        {name:'Price'}
                    ])
DataAttribute.create([
                     {name: 'Description'}
                 ])
ItemAttributeLedger.create([
                               {item_id: 1,
                               data_attribute_id: 1,
                               data: 'Precious Metal Great Store Of Value'}
                           ])
CategoryItemLedger.create([
   {item_id: 1, category_id: 1},
   {item_id: 2, category_id: 2},
   {item_id: 3, category_id: 3},
   {item_id: 4, category_id: 4},
   {item_id: 5, category_id: 5},
   {item_id: 5, category_id: 6},
   {item_id: 5, category_id: 7},
   {item_id: 5, category_id: 8}
  ])
