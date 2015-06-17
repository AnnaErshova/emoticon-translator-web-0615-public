# require gems here
require 'yaml'
require 'pry'


#has two keys, 'get_meaning' and 'get_emoticon' (FAILED - 1)
#the keys 'get_meaning' and 'get_emoticon' point to inner hashes (FAILED - 2)

#the keys inside the 'get_meaning' hash are the Japanese emoticons (FAILED - 3)
#the emoticon keys inside the 'get_meaning' hash point to their meanings (FAILED - 4)

#the keys inside the 'get_emoticon' hash are the English emoticons (FAILED - 5)
#the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents (FAILED -

=begin
  => {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}
=end

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}} # have to pre-set the keys, otherwise iteration will become problematic as it will keep overwriting
  #new_hash[get_meaning] = {hash_array[1] => english_word}
  #new_hash[get_emoticon] = {hash_array[0] => hash_array[1]}
  emoticons.each do |english_word, hash_array| #<= "angel"=>["O:)", "☜(⌒▽⌒)☞"], hash_array[0] = Engl, hash_array[1] = Japanese
      new_hash["get_meaning"][hash_array[1]] = english_word # Japanese emoticon => English meaning
      new_hash["get_emoticon"][hash_array[0]] = hash_array[1] # English emoticon => Japanese emoticon
  end
  new_hash
end

#Write a method that will take a traditional Western emoticon, like `:)` and translate it to its Japanese version. 
#It will rely on the method above. Refer to the table below for translations.
=begin
=> {"get_meaning"=>
  {"☜(⌒▽⌒)☞"=>"angel",
   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
   "(ΘεΘ;)"=>"bored",
   "(゜.゜)"=>"confused",
   "(#^.^#)"=>"embarrased",
   ">゜))))彡"=>"fish",
   "(^0_0^)"=>"glasses",
   "(￣ー￣)"=>"grinning",
   "(＾ｖ＾)"=>"happy",
   "(*^3^)/~☆"=>"kiss",
   "(Ｔ▽Ｔ)"=>"sad",
   "o_O"=>"surprised",
   "(^_-)"=>"wink"},
 "get_emoticon"=>
  {"O:)"=>"☜(⌒▽⌒)☞",
   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
   ":O"=>"(ΘεΘ;)",
   "%)"=>"(゜.゜)",
   ":$"=>"(#^.^#)",
   "><>"=>">゜))))彡",
   "8D"=>"(^0_0^)",
   "=D"=>"(￣ー￣)",
   ":)"=>"(＾ｖ＾)",
   ":*"=>"(*^3^)/~☆",
   ":'("=>"(Ｔ▽Ｔ)",
   ":o"=>"o_O",
   ";)"=>"(^_-)"}}
=end
def get_japanese_emoticon(path, emoticon)
  # need to look at "get_moticon"'s' keys
  # load_library(path) => gives us the modified array, see above
  new_hash = load_library(path) # this has to be done separately
  new_hash["get_emoticon"].has_key?(emoticon) ? new_hash["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end # end method

# get_english_meaning returns the Japanese equivalent of an English
def get_english_meaning(path, emoticon) # input will be Western emoticon
  new_hash = load_library(path)
  new_hash["get_meaning"].has_key?(emoticon) ? new_hash["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end



