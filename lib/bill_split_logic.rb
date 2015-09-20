class BillSplitterLogic

  attr_reader :bill_total, :people_count, :total_booze, :boozers, :total_softdrinks, :soft_drinkers

  def initialize bill_total, people_count, total_booze, boozers, total_softdrinks, soft_drinkers
    @bill_total = bill_total
    @people_count = people_count
    @total_booze = total_booze
    @boozers = boozers
    @total_softdrinks = total_softdrinks
    @soft_drinkers = soft_drinkers
  end

  def split_bill
    { just_food: food_only_bill, food_and_booze: boozers_bill, food_and_softdrinks: soft_drinkers_bill }
  end

  private

  def food_only_bill
    (bill_total - total_booze - total_softdrinks) / people_count
  end

  def boozers_bill
    return 0 if boozers == 0
    food_only_bill + (total_booze / boozers)
  end

  def soft_drinkers_bill
    return 0 if soft_drinkers == 0
    food_only_bill + (total_softdrinks / soft_drinkers)
  end

end
