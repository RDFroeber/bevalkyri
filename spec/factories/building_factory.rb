FactoryGirl.define do
  factory :building do
    player
    board
    x_cord "01"
    y_cord "01"

    factory :castle, class: Castle do
      population 50
    end
    

    factory :house, class: House do
      population 5
      level 1
    end
  end
end