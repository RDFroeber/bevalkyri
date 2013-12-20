FactoryGirl.define do
  factory :building do
    player
    board
    x_cord "01"
    y_cord "01"

    factory :castle, class: Castle, parent: :building do
      type "Castle"
      population 50
    end
    

    factory :house, class: House, parent: :building do
      type "House"
      population 5
      level 1
    end
  end
end