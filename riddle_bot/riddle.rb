# frozen_string_literal: true

module RiddleBot
  # Contains and presents exactly one riddle
  class Riddle
    attr_reader :question, :answer

    def initialize(question, answer)
      @question = question
      @answer = answer
    end

    def to_message
      "#{@question}\n||#{@answer}||"
    end
  end
end
