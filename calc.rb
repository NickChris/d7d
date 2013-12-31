# BARBARIAN
# BARD
# CLERIC
# DRUID
# FIGHTER
# MONK
# PALADIN
# RANGER
# ROGUE
# SORCERER
# WIZARD

BARBARIAN_BAB = 'High'
BARD_BAB      = 'Med'
CLERIC_BAB    = 'Med'
DRUID_BAB     = 'Med'
FIGHTER_BAB   = 'High'
MONK_BAB      = 'Med'
PALADIN_BAB   = 'High'
RANGER_BAB    = 'High'
ROGUE_BAB     = 'Med'
SORCERER_BAB  = 'Low'
WIZARD_BAB    = 'Low'

HIGH = 1
MED  = 3/4
LOW  = 1/2

clvls = { 'BARBARIAN' => 2,
					'BARD' => 1,
					'RANGER' => 2
}

levels = ['f', 'f', 'r', 'f']

puts clvls
puts

total_BAB = 0

clvls.each do |k, v|
	case k
		when 'BARBARIAN' then total_BAB = total_BAB + (v * HIGH)
		when 'BARD' 		 then total_BAB = total_BAB + (v * MED)
		when 'CLERIC' 	 then total_BAB = total_BAB + (v * MED)
		when 'DRUID' 	 	 then total_BAB = total_BAB + (v * MED)
		when 'FIGHTER' 	 then total_BAB = total_BAB + (v * HIGH)
		when 'MONK' 		 then total_BAB = total_BAB + (v * MED)
		when 'PALADIN' 	 then total_BAB = total_BAB + (v * HIGH)
		when 'RANGER' 	 then total_BAB = total_BAB + (v * HIGH)
		when 'ROGUE' 		 then total_BAB = total_BAB + (v * MED)
		when 'SORCERER'  then total_BAB = total_BAB + (v * LOW)
		when 'WIZARD' 	 then total_BAB = total_BAB + (v * LOW)
	end
end

puts "Base Attack: #{total_BAB}"