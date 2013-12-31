# Stat Scores
# => point buy
#     * 10, 15, 20, or 25
#     * 7 –4
#     * 8 –2
#     * 9 –1
#     * 10  0
#     * 11  1
#     * 12  2
#     * 13  3
#     * 14  5
#     * 15  7
#     * 16  10
#     * 17  13
#     * 18  17
# choose stats
# choose race

LF = 10
SF = 15
HF = 20
EF = 25

valid_stats  = true

def point_buy(points)
	case points
		when 7  then –4
		when 8  then –2
		when 9  then –1
		when 10 then 0
		when 11 then 1
		when 12 then 2
		when 13 then 3
		when 14 then 5
		when 15 then 7
		when 16 then 10
		when 17 then 13
		when 18 then 17
		else
			puts "Not a valid choice"

while true
	puts "What Campaign type is the character in?"
	puts "1.Low Fantasy  2.Standard Fantasy  3.High Fantasy  4.Epic Fantasy"
	points_choice = gets.chomp

	if !['1', '2', '3', '4'].include?(points_choice)
		puts "Please choose 1, 2, 3, or 4."
		next
	elsif points_choice == '1'
		puts "You have #{LF} points to spend"
		puts
		break
	elsif points_choice == '2'
		puts "You have #{SF} points to spend"
		puts
		break
	elsif points_choice == '3'
		puts "You have #{HF} points to spend"
		puts
		break
	else
		puts "You have #{EF} points to spend"
		puts
		break
	end
end
	


puts "Enter in your starting stats:"
puts "Stat scores range from 7 to 18"
print "STR: "
str_score = gets.chomp.to_i
print "DEX: "
dex_score = gets.chomp.to_i
print "CON: "
con_score = gets.chomp.to_i
print "INT: "
int_score = gets.chomp.to_i
print "WIS: "
wis_score = gets.chomp.to_i
print "CHA: "
cha_score = gets.chomp.to_i

str_mod = ((str_score - 10)/2)
dex_mod = ((dex_score - 10)/2)
con_mod = ((con_score - 10)/2)
int_mod = ((int_score - 10)/2)
wis_mod = ((wis_score - 10)/2)
cha_mod = ((cha_score - 10)/2)

puts
puts
puts "STR: #{str_score} | #{str_mod}"
puts "DEX: #{dex_score} | #{dex_mod}"
puts "CON: #{con_score} | #{con_mod}"
puts "INT: #{int_score} | #{int_mod}"
puts "WIS: #{wis_score} | #{wis_mod}"
puts "CHA: #{cha_score} | #{cha_mod}"
