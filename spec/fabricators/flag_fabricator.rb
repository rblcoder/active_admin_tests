Fabricator(:flag) do
  name  { Faker::Name.name }
  # is_active { %w(true false).sample }
  # is_active {true }
  is_active {[true,false][rand(2)]}
end