require 'rubygems'
require 'ccsv'

def in_groups_of(collection, number)
  # size % number gives how many extra we have;
  # subtracting from number gives how many to add;
  # modulo number ensures we don't add group of just fill.
  padding = (number - collection.size % number) % number
  collection = collection.dup.concat([collection] * padding)
  collection.each_slice(number) { |slice| yield(slice) }
end

def say(sentence)
  system("say '#{sentence}'")
  sleep(0.5)
end

wd_list = []

Ccsv.foreach(ARGV[0]) do |row|
  wd_list << "#{row[0]} means #{row[1]}."
end

while(true)
  in_groups_of(wd_list, 4) do |wds|
    4.times do
      wds.each do |wd|
        say(wd)
      end
    end
  end
  
  # wd_list.each do |wd|
  #   4.times{say(wd)}
  #   # system("say '#{wd}'")
  #   # sleep(1)
  # end
end