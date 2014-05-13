# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :message do |m|
    m.subject { Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6) }
    m.body { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3) }
    # m.read_at "2014-05-12 21:07:48"
    m.association :sender, factory: :person
    m.association :recipient, factory: :person
  end
end
