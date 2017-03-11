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