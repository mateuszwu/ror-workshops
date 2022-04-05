class RoundSummaryJob < ApplicationJob
  queue_as :default

  def perform(round)

  end
end