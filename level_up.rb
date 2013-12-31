require 'rubygems'

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

#Player chosen per level
# => Skills: where ranks go
# => Favored class bonus: hp, skill or racial

#Class dependent:
#     * max rank in a skill = character level

#Skill dependent:
# => Total
#     * stat mod + rank + class skill + misc (feats, racial, template, etc)
# => Rank
#     * max per skill of character level
# => Class Skill
#     * always a class skill once have one rank
#     * class_skills put into an array, array.unique to get ride of duplicates
#     * boolean if true then total +3
# => Misc (last thing to add/calculate)
#     * racial + 2
#     * feats like negotiator or skill focus
#     * template such as vampire or celestial

# case z
#   when 'Barbarian' 
#   when 'Bard' 
#   when 'Cleric' 
#   when 'Druid' 
#   when 'Fighter' 
#   when 'Monk' 
#   when 'Paladin' 
#   when 'Ranger' 
#   when 'Rogue' 
#   when 'Sorcerer'
#   when 'Wizard'
# end

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


STR = 10
CON = 12
DEX = 18
INT = 13
WIS = 16
CHA = 9



#Hit Dice Constants
BARBARIAN_HD = 12
BARD_HD      = 8
CLERIC_HD    = 8
DRUID_HD     = 8
FIGHTER_HD   = 10
MONK_HD      = 8
PALADIN_HD   = 10
RANGER_HD    = 10
ROGUE_HD     = 8
SORCERER_HD  = 6
WIZARD_HD    = 6


#Skill Point Constants
BARBARIAN_RANKS = 4
BARD_RANKS      = 6
CLERIC_RANKS    = 2
DRUID_RANKS     = 4
FIGHTER_RANKS   = 2
MONK_RANKS      = 4
PALADIN_RANKS   = 2
RANGER_RANKS    = 6
ROGUE_RANKS     = 8
SORCERER_RANKS  = 2
WIZARD_RANKS    = 4

#Class Skills
BARBARIAN_SKILLS  = ['Acrobatics', 'Climb', 'Craft', 'Handle Animal', 'Intimidate', 'Knowledge (nature)', 'Perception', 'Ride', 'Survival', 'Swim']
BARD_SKILLS       = ['Acrobatics', 'Appraise', 'Bluff', 'Climb', 'Craft', 'Diplomacy', 'Disguise', 'Escape Artist', 'Intimidate', 'Knowledge (arcana)', 'Knowledge (dungeoneering)',
        'Knowledge (engineering)', 'Knowledge (geography)', 'Knowledge (history)', 'Knowledge (local)', 'Knowledge (nature)', 'Knowledge (nobility)', 'Knowledge (planes)', 
        'Knowledge (religion)', 'Linguistics', 'Perception', 'Perform', 'Profession', 'Sense Motive', 'Sleight of Hand', 'Spellcraft', 'Stealth', 'Use Magic Device']
CLERIC_SKILLS     = ['Appraise', 'Craft', 'Diplomacy', 'Heal', 'Knowledge (arcana)', 'Knowledge (history)', 'Knowledge (nobility)', 'Knowledge (planes)', 'Knowledge (religion)', 
        'Linguistics', 'Profession', 'Sense Motive', 'Spellcraft']
DRUID_SKILLS      = ['Climb', 'Craft', 'Fly', 'Handle Animal', 'Heal', 'Knowledge (geography)', 'Knowledge (nature)', 'Perception', 'Profession', 'Ride', 
        'Spellcraft', 'Survival', 'Swim']
FIGHTER_SKILLS    = ['Climb', 'Craft', 'Handle Animal', 'Intimidate', 'Knowledge (dungeoneering)', 'Knowledge (engineering)', 'Profession', 'Ride', 'Survival', 'Swim']
MONK_SKILLS       = ['Acrobatics', 'Climb', 'Craft', 'Escape Artist', 'Intimidate', 'Knowledge (history)', 'Knowledge (religion)', 'Perception', 'Perform', 'Profession', 
        'Ride', 'Sense Motive', 'Stealth', 'Swim']
PALADIN_SKILLS    = ['Craft', 'Diplomacy', 'Handle Animal', 'Heal', 'Knowledge (nobility)', 'Knowledge (religion)', 'Profession', 'Ride', 'Sense Motive', 'Spellcraft']
RANGER_SKILLS     = ['Climb', 'Craft', 'Handle Animal', 'Heal', 'Intimidate', 'Knowledge (dungeoneering)', 'Knowledge (geography)', 'Knowledge (nature)', 'Perception', 
        'Profession', 'Ride', 'Spellcraft', 'Stealth', 'Survival', 'Swim']
ROGUE_SKILLS      = [ 'Acrobatics', 'Appraise', 'Bluff', 'Climb', 'Craft', 'Diplomacy', 'Disable Device', 'Disguise', 'Escape Artist', 'Intimidate', 'Knowledge (dungeoneering)', 
        'Knowledge (local)', 'Linguistics', 'Perception', 'Perform', 'Profession', 'Sense Motive', 'Sleight of Hand', 'Stealth', 'Swim', 'Use Magic Device']
SORCERER_SKILLS   = ['Appraise', 'Bluff', 'Craft', 'Fly', 'Intimidate', 'Knowledge (arcana)', 'Profession', 'Spellcraft', 'Use Magic Device']
WIZARD_SKILLS     = [ 'Appraise', 'Craft', 'Fly', 'Knowledge (arcana)', 'Knowledge (dungeoneering)', 'Knowledge (engineering)', 'Knowledge (geography)', 'Knowledge (history)', 
        'Knowledge (local)', 'Knowledge (nature)', 'Knowledge (nobility)', 'Knowledge (planes)', 'Knowledge (religion)', 'Linguistics', 'Profession', 'Spellcraft']

#Class Saves
BARBARIAN_SAVES = ['G', 'B', 'B']
BARD_SAVES      = ['B', 'G', 'G']
CLERIC_SAVES    = ['G', 'B', 'G']
DRUID_SAVES     = ['G', 'B', 'G']
FIGHTER_SAVES   = ['G', 'B', 'B']
MONK_SAVES      = ['G', 'G', 'G']
PALADIN_SAVES   = ['G', 'B', 'G']
RANGER_SAVES    = ['G', 'G', 'B']
ROGUE_SAVES     = ['B', 'G', 'B']
SORCERER_SAVES  = ['B', 'B', 'G']
WIZARD_SAVES    = ['B', 'B', 'G']

#Base Attack
HIGH = 1
MED  = 0.75
LOW  = 0.5
BARBARIAN_BAB = HIGH
BARD_BAB      = MED
CLERIC_BAB    = MED
DRUID_BAB     = MED
FIGHTER_BAB   = HIGH
MONK_BAB      = MED
PALADIN_BAB   = HIGH
RANGER_BAB    = HIGH
ROGUE_BAB     = MED
SORCERER_BAB  = LOW
WIZARD_BAB    = LOW


def calculate_hp(levels)
  con_mod = ((CON-10)/2)
  total_hp = 0
  case levels[0]
    when 'Barbarian'  then total_hp = total_hp + ((BARBARIAN_HD/2)-1) 
    when 'Bard'       then total_hp = total_hp + ((BARD_HD/2)-1) 
    when 'Cleric'     then total_hp = total_hp + ((CLERIC_HD/2)-1) 
    when 'Druid'      then total_hp = total_hp + ((DRUID_HD/2)-1) 
    when 'Fighter'    then total_hp = total_hp + ((FIGHTER_HD/2)-1) 
    when 'Monk'       then total_hp = total_hp + ((MONK_HD/2)-1) 
    when 'Paladin'    then total_hp = total_hp + ((PALADIN_HD/2)-1) 
    when 'Ranger'     then total_hp = total_hp + ((RANGER_HD/2)-1) 
    when 'Rogue'      then total_hp = total_hp + ((ROGUE_HD/2)-1) 
    when 'Sorcerer'   then total_hp = total_hp + ((SORCERER_HD/2)-1) 
    when 'Wizard'     then total_hp = total_hp + ((WIZARD_HD/2)-1) 
  end

  levels.each do |hp|
    case hp
      when 'Barbarian'  then total_hp = total_hp + con_mod + ((BARBARIAN_HD/2)+1)
      when 'Bard'       then total_hp = total_hp + con_mod + ((BARD_HD/2)+1)
      when 'Cleric'     then total_hp = total_hp + con_mod + ((CLERIC_HD/2)+1)
      when 'Druid'      then total_hp = total_hp + con_mod + ((DRUID_HD/2)+1)
      when 'Fighter'    then total_hp = total_hp + con_mod + ((FIGHTER_HD/2)+1)
      when 'Monk'       then total_hp = total_hp + con_mod + ((MONK_HD/2)+1)
      when 'Paladin'    then total_hp = total_hp + con_mod + ((PALADIN_HD/2)+1)
      when 'Ranger'     then total_hp = total_hp + con_mod + ((RANGER_HD/2)+1)
      when 'Rogue'      then total_hp = total_hp + con_mod + ((ROGUE_HD/2)+1)
      when 'Sorcerer'   then total_hp = total_hp + con_mod + ((SORCERER_HD/2)+1)
      when 'Wizard'     then total_hp = total_hp + con_mod + ((WIZARD_HD/2)+1)
    end
  end
  total_hp
end

def calculate_levels(levels)
  @clvl_hash = Hash[levels.group_by {|x| x}.map {|k,v| [k,v.count]}]
end

def display_levels(hash)
  hash.each{ |k,v| puts "=>#{k}: #{v}" }
end

def calculate_skill_ranks(character)
  int_mod = ((INT-10)/2)
  total_skills = 0
  skill_points = character.each do |x|
    case x
      when 'Barbarian'  then total_skills = total_skills + int_mod + BARBARIAN_RANKS
      when 'Bard'       then total_skills = total_skills + int_mod + BARD_RANKS
      when 'Cleric'     then total_skills = total_skills + int_mod + CLERIC_RANKS
      when 'Druid'      then total_skills = total_skills + int_mod + DRUID_RANKS
      when 'Fighter'    then total_skills = total_skills + int_mod + FIGHTER_RANKS
      when 'Monk'       then total_skills = total_skills + int_mod + MONK_RANKS
      when 'Paladin'    then total_skills = total_skills + int_mod + PALADIN_RANKS
      when 'Ranger'     then total_skills = total_skills + int_mod + RANGER_RANKS
      when 'Rogue'      then total_skills = total_skills + int_mod + ROGUE_RANKS
      when 'Sorcerer'   then total_skills = total_skills + int_mod + SORCERER_RANKS
      when 'Wizard'     then total_skills = total_skills + int_mod + WIZARD_RANKS
    end
  end
  total_skills 
end

def add_class_skills(levels)
  character_class_skills = []
  levels.each do |z|
    case z
      when 'Barbarian'  then character_class_skills << BARBARIAN_SKILLS
      when 'Bard'       then character_class_skills << BARD_SKILLS
      when 'Cleric'     then character_class_skills << CLERIC_SKILLS
      when 'Druid'      then character_class_skills << DRUID_SKILLS
      when 'Fighter'    then character_class_skills << FIGHTER_SKILLS
      when 'Monk'       then character_class_skills << MONK_SKILLS
      when 'Paladin'    then character_class_skills << PALADIN_SKILLS
      when 'Ranger'     then character_class_skills << RANGER_SKILLS
      when 'Rogue'      then character_class_skills << ROGUE_SKILLS
      when 'Sorcerer'   then character_class_skills << SORCERER_SKILLS
      when 'Wizard'     then character_class_skills << WIZARD_SKILLS
    end
  end
  character_class_skills.flatten!.uniq!
  character_class_skills.sort!
end

def calculate_base_attack(levels)
  total_BAB = 0
  levels.each do |k, v|
    case k
      when 'Barbarian'  then total_BAB = total_BAB + (v * BARBARIAN_BAB).to_i
      when 'Bard'       then total_BAB = total_BAB + (v * BARD_BAB).to_i
      when 'Cleric'     then total_BAB = total_BAB + (v * CLERIC_BAB).to_i
      when 'Druid'      then total_BAB = total_BAB + (v * DRUID_BAB).to_i
      when 'Fighter'    then total_BAB = total_BAB + (v * FIGHTER_BAB).to_i
      when 'Monk'       then total_BAB = total_BAB + (v * MONK_BAB).to_i
      when 'Paladin'    then total_BAB = total_BAB + (v * PALADIN_BAB).to_i
      when 'Ranger'     then total_BAB = total_BAB + (v * RANGER_BAB).to_i
      when 'Rogue'      then total_BAB = total_BAB + (v * ROGUE_BAB).to_i
      when 'Sorcerer'   then total_BAB = total_BAB + (v * SORCERER_BAB).to_i
      when 'Wizard'     then total_BAB = total_BAB + (v * WIZARD_BAB).to_i
    end
  end
  total_BAB
end

def saves_formula(save_array, class_levels)
  save_array.each do |x|
    case x
      when 'G' then @save << (class_levels/2)+2
      when 'B' then @save << (class_levels/3)
    end
  end
  @save
end

def calculate_base_saves(levels)
  fort = 0
  ref = 0
  will = 0
  @save = []
  levels.each do |k,v|
    case k
      when 'Barbarian'  then saves_formula(BARBARIAN_SAVES, v)
      when 'Bard'       then saves_formula(BARD_SAVES, v)
      when 'Cleric'     then saves_formula(CLERIC_SAVES, v)
      when 'Druid'      then saves_formula(DRUID_SAVES, v)
      when 'Fighter'    then saves_formula(FIGHTER_SAVES, v)
      when 'Monk'       then saves_formula(MONK_SAVES, v)
      when 'Paladin'    then saves_formula(PALADIN_SAVES, v)
      when 'Ranger'     then saves_formula(RANGER_SAVES, v)
      when 'Rogue'      then saves_formula(ROGUE_SAVES, v)
      when 'Sorcerer'   then saves_formula(SORCERER_SAVES, v)
      when 'Wizard'     then saves_formula(WIZARD_SAVES, v)
    end
  end

  @save.each_index do |i|
    if i%3 == 0
      fort = fort + @save[i]
    elsif i%3 == 1
      ref = ref + @save[i]
    elsif i%3 == 2
      will = will + @save[i]
    end
  end

  puts "Fortitude: " + fort.to_s + " | Reflex: " + ref.to_s + " | Will: " + will.to_s
end

def choose_class
  puts "What class would you like to level in?"
  puts '1. Barbarian'
  puts '2. Bard'
  puts '3. Cleric'
  puts '4. Druid'
  puts '5. Fighter'
  puts '6. Monk'
  puts '7. Paladin'
  puts '8. Ranger'
  puts '9. Rogue'
  puts '10. Sorcerer'
  puts '11. Wizard'
  level_choice = gets.chomp

  case level_choice
    when '1'  then @char_levels << 'Barbarian'
    when '2'  then @char_levels << 'Bard'
    when '3'  then @char_levels << 'Cleric'
    when '4'  then @char_levels << 'Druid'
    when '5'  then @char_levels << 'Fighter'
    when '6'  then @char_levels << 'Monk'
    when '7'  then @char_levels << 'Paladin'
    when '8'  then @char_levels << 'Ranger'
    when '9'  then @char_levels << 'Rogue'
    when '10' then @char_levels << 'Sorcerer'
    when '11' then @char_levels << 'Wizard'
    else  
      choose_class
  end
  level_again?
end

def level_again?
  puts "Would you like to add a new level? 1. Yes 2. No"
  continue = gets.chomp
  if !['1', '2'].include?(continue)
    puts "Sorry, you must enter 1, or 2"
    level_again?
  elsif continue == "1"
    level_up_class
    choose_class
  elsif continue == "2"
    level_up_class
    exit
  end
end

def level_up_class   
  puts "Level: " + @char_levels.length.to_s 
  puts "( #{display_levels(calculate_levels(@char_levels))} )"
  puts "HP: #{calculate_hp(@char_levels)}"
  puts "Skill ranks: #{calculate_skill_ranks(@char_levels)}"
  puts "Class Skills: #{add_class_skills(@char_levels)}"
  puts "#{calculate_base_saves(@clvl_hash)}"
  puts "BAB: #{calculate_base_attack(@clvl_hash).to_i}"
end

def set_character_name
  puts 'What is the character name?'
  @char_name = gets.chomp
  puts
end

def start
  @char_levels = []
  set_character_name
  puts @char_name
  choose_class
end

start
