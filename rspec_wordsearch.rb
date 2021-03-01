# Here your code !

require 'rspec'

RSpec.describe "sampled" do 
    it { expect(subject).to eq "sampled" }
    
end




class WordSearch
  def initialize(board, word)
    @word = word.to_s.split('')
    @board = board
    @search = []
  end

  def process
    @word.each do |letter|
      left_index = @board.index letter
      right_index = @board.reverse.index letter
      if left_index <= right_index
        left_operation(letter, left_index)
      else
        right_operation(letter, right_index)
      end
    end
    print_output
  end

  def left_operation(letter, index)
    r = []
    oper =  @board.shift(index)
    @board.shift
    @board += oper
    r << 'LEFT, ' * index + 'LEFT:' + letter
    @search << r
  end

  def right_operation(letter, index)
    r = []
    oper = @board.pop(index)
    @board.pop
    @board.unshift(*oper)
    r << 'RIGHT, ' * index + 'RIGHT:' + letter
    @search << r
  end

  def print_output
    return @search.join(', ')
  end
end


    describe WordSearch do

      it "finds the word cat in given array" do
        word_search = WordSearch.new(%w[a z c t v a], 'cat')
        expect(word_search.process).to eq('LEFT, LEFT, LEFT:c, RIGHT, RIGHT:a, LEFT, LEFT:t')
      end

      it "finds the word bat in given array" do
        word_search = WordSearch.new(%w[a z c b t v a], 'bat')
        expect(word_search.process).to eq('LEFT, LEFT, LEFT, LEFT:b, LEFT, LEFT, LEFT:a, RIGHT, RIGHT:t')
      end

      it "finds the word cat in given array" do
        word_search = WordSearch.new(%w[a z c b t v a], 'bata')
        expect(word_search.process).to eq('LEFT, LEFT, LEFT, LEFT:b, LEFT, LEFT, LEFT:a, RIGHT, RIGHT:t, LEFT, LEFT:a')
      end
    end

RSpec::Core::Runner.run(["-f","d"])
