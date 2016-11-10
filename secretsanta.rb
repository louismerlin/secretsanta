# Dependencies
require 'gmail'
require 'io/console'

# Import people from people.txt
people = []
File.open("people.txt").each_line do |line|
    data = line.split(" ")
    people.push({name: data[0], email: data[1]})
end

# Create the present repartition
begin
    list = []
    people.each_index {|i| list.push(i)}
    for person in people
        ran = rand(list.length)
        person[:chosen] = list.delete_at(ran)
    end
end while people.any? {|person| people.index(person)==person[:chosen]}
# Restart if someone has himself assigned

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
end

gmail.logout
