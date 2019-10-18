require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons_file = YAML.load_file(file_path)
  
  japanese_emoticons = emoticons_file.map do |meaning, emoticons|
    emoticons[1]
  end
  
  english_emoticons = emoticons_file.map do |meaning, emoticons|
    emoticons[0]
  end
  
  meanings = emoticons_file.map do |meaning, emoticons|
    meaning
  end
  
  {
    :get_meaning => {
      #the keys inside the 'get_meaning' hash are the Japanese emoticons
      #the emoticon keys inside the 'get_meaning' hash point to their meanings
      japanese_emoticons.map do |k, v|
        binding.pry
      end
    },
    :get_emoticon => {
      english_emoticons[0] => japanese_emoticons[0],
      english_emoticons[1] => japanese_emoticons[1],
      english_emoticons[2] => japanese_emoticons[2],
      english_emoticons[3] => japanese_emoticons[3],
      english_emoticons[4] => japanese_emoticons[4],
      english_emoticons[5] => japanese_emoticons[5],
      english_emoticons[6] => japanese_emoticons[6],
      english_emoticons[7] => japanese_emoticons[7],
      english_emoticons[8] => japanese_emoticons[8],
      english_emoticons[9] => japanese_emoticons[9],
      english_emoticons[10] => japanese_emoticons[10],
      english_emoticons[11] => japanese_emoticons[11],
      english_emoticons[12] => japanese_emoticons[12]
    }
  }
end

def get_japanese_emoticon(file_path, emoticon)
    emoticon_hash = load_library(file_path)
    if emoticon_hash[:get_emoticon].has_key?(emoticon)
      return emoticon_hash[:get_emoticon][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash[:get_meaning].has_key?(emoticon)
      return emoticon_hash[:get_meaning][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end
