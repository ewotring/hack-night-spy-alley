class Spy
attr_accessor :bank

  def initialize(identity, score_card, bank = 0)
    @identity = identity
    @score_card = score_card
    @bank = bank
    # make score_card a hash or array with booleans
  end

  def choose_identity(identity)

  end

  def collect_money
  end

  def pay_money
  end

  def purchase_spy_item
  end

  def receive_move_card
  end

  def receive_free_gift
  end

  def make_another_move
  end

end
