Food.delete_all
# . . .
Food.create(title: 'Pan Pizza - Margarita',
description:
%{<p>
<em>Tomato sauce and Mozzarella cheese</em>
Here is the archetype of a thin-crust pizza pie, a pizza margherita adorned simply in the colors of the Italian flag: green from basil, white from mozzarella, red from tomato sauce. This pizza is adapted from the recipe used by the staff at Roberta’s restaurant in Brooklyn, who make their tomato sauce simply by whizzing together canned tomatoes, a drizzle of olive oil and a pinch of salt. The ingredients offer in their proportions what appears to be a kind of austerity — not even 3 ounces of cheese! But the result is home-cooked pizza to beat the band, exactly the sort of recipe to start a career in home pizza-making, and to return to again and again.
</p>},
image_url: 'Pizza_Hut_Margherita_Pizza.jpg',
price: 40.26)
# . . .
Food.create(title: 'Garlic Bread Supreme ',
  description:
    %{<p>
      Freshly baked French bread with garlic butter, melted mozzarella cheese and herbs
      </p>},
  image_url: '4.jpg',
  price: 19.91 )
# . . .

Food.create(title: 'Pan Pizza - Super Supreme ',
  description:
    %{<p>
      Beef pepperoni, pure beef, mushroom, green pepper, onions and black olives
      </p>},
  image_url: 'pizza-hut-trinidad-and-tobago-super-supreme.png',
  price: 58.85 )

Area.delete_all
# . . .
Area.create(name: "Addoha val fleuri")
Area.create(name: "Aida Village")
Area.create(name: "Ain El Hyani")
Area.create(name: "Ain ktiot")
Area.create(name: "Almoujahidine")
Area.create(name: "Ancienne medina")
Area.create(name: "Bassatine")
Area.create(name: "Beausejour")
Area.create(name: "Bella Vista")
Area.create(name: "Ben dibane")
Area.create(name: "Benkirane")
Area.create(name: "Bni makada")
Area.create(name: "Bni makada -lakdima")
Area.create(name: "Boubana")
Area.create(name: "Brance 1")
Area.create(name: "Brance 2")
Area.create(name: "Californie")
Area.create(name: "Casabarata")
Area.create(name: "Castilla")
Area.create(name: "Centre ville")
Area.create(name: "Charf")
Area.create(name: "Dradeb")
Area.create(name: "El azib")
Area.create(name: "Ennasr")
Area.create(name: "Ibiria")
Area.create(name: "Idrissia")
Area.create(name: "Jbel Lkbir")
Area.create(name: "Jirari")
Area.create(name: "Lala chafia")
Area.create(name: "Lkharba")
Area.create(name: "Malabata")
Area.create(name: "Marshan")
Area.create(name: "Mesnana")
Area.create(name: "Mghogha")
Area.create(name: "Mouadafine")
Area.create(name: "Nejma-Mozart")
Area.create(name: "Nzaha")
Area.create(name: "Playa")
Area.create(name: "Quartier Espagnol")
Area.create(name: "Rah Rah")
Area.create(name: "Sad Village")
Area.create(name: "Sania")
Area.create(name: "Souani")
