
(1..47).each do |id|
  Prefecture.create id: id, name: "pref_#{id}"
end

200.times{
  shokunin=Shokunin.create(prefecture_id: (1..47).to_a.sample)
  gen=->{('a'..'z').to_a.sample}
  name=gen[]+gen[]+gen[]+gen[]
  (1..10).to_a.sample.times do |i|
    shokunin.profiles.create(name:name,active:rand>0.5)
  end
}
