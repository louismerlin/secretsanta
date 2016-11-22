# Dependencies
require 'gmail'
require 'io/console'

# Import people from people.txt
people = []
File.open("people.txt").each_line do |line|
    data = line.split(" ")
    people.push({name: data[0], email: data[1]})
		# Add restriction for "couples"
		if data[2] == "NOT"
			other = people.select { |person| person[:name] == data[3] }.first
			people.last[:not] = people.index(other)
			other[:not] = people.index(people.last)
		end
end

# Create the present repartition
begin
    list = []
    people.each_index {|i| list.push(i)}
    for person in people
        ran = rand(list.length)
        person[:chosen] = list.delete_at(ran)
    end
end while (people.any? {|person| people.index(person) == person[:chosen]} || people.any? {|person| person[:not] == person[:chosen]})
# Restart if someone has himself assigned or if couples are chosen for each other in any way

# Gmail login
puts "Gmail username: "
username = gets.chomp
puts "Password: "
password = STDIN.noecho(&:gets).chomp
gmail = Gmail.connect(username, password)

# Send mails
for person in people
    gmail.deliver do
        to person[:email]
        subject "Your secret santa match!!"
        body "Hi " + person[:name] + "!\n\nYour secret santa match this year is " + people[person[:chosen]][:name] + ".\n\nWith love,\nSanta"
    end
		puts "from " + person[:name] + " to " + people[person[:chosen]][:name]
end

gmail.logout
