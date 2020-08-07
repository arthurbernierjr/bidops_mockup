# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([
                    {name: 'Commodity'}
                ])
Item.create([
                {name: 'Gold'}
            ])
DataProperty.create([
                        {name:'Price'}
                    ])
DataAttribute.create([
                     {name: 'Love'}
                 ])
ItemAttributeLedger.create([
                               item_id: 1,
                               data_attribute_id: 1,
                               data: 'hello'
                           ])